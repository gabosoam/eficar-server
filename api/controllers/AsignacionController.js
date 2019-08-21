/**
 * AsignacionController
 *
 * @description :: Server-side actions for handling incoming requests.
 * @help        :: See https://sailsjs.com/docs/concepts/actions
 */

const firebase = require('../firebase/firebase');

module.exports = {

  saludar: async function (req, res) {

    firebase.messaging().sendToTopic('ecuador', {

      notification: {
        title: 'Nuevo Evento',
        body: 'Invitado de honor en las salas de Quito',
        sound: "default",
        color: '#813789'
      },


    })
      .then((response) => {
        console.log(response)
        return true
      })
      .catch((error) => {
        console.log(error)
        return false
      })

    res.send("Hello from Firebase!");
  },


  vista: async function (req, res) {


    var sql = 'SELECT * from vista_asignaciones';

    var rawResult = await sails.sendNativeQuery(sql);

    res.send(rawResult.rows);
  },

  espera: async function (req, res) {
    var usuario = req.query.usuario;

    var sql = 'SELECT * from vista_asignaciones WHERE estado=1 AND id_persona = $1';

    var rawResult = await sails.sendNativeQuery(sql, [usuario]);

    res.send(rawResult.rows);
  },

  vistalist: async function (req, res) {
    var usuario = req.query.usuario;

    var sql = 'SELECT * from vista_asignaciones WHERE id_persona = $1';

    var rawResult = await sails.sendNativeQuery(sql, [usuario]);

    res.send(rawResult.rows);
  },

  operadores: async function (req, res) {
    var date = req.query.date;

    var sql = "SELECT id,estado,identificacion,nombre,direccion,telefono,email, (SELECT COUNT(*)FROM asignacion WHERE operador = persona.id AND DATE(asignacion.hora_inicio) = DATE('"+date+"')) as count FROM persona where es_empleado = 1 AND es_operador=1 and estado =1 ORDER BY count";

    var rawResult = await sails.sendNativeQuery(sql);

    res.send(rawResult.rows);
  },

  vistalistcliente: async function (req, res) {
    var usuario = req.query.usuario;

    var sql = 'SELECT * from vista_asignaciones WHERE cliente = $1';

    var rawResult = await sails.sendNativeQuery(sql, [usuario]);

    res.send(rawResult.rows);
  },

  vistalist: async function (req, res) {
    var usuario = req.query.usuario;

    var sql = 'SELECT * from vista_asignaciones WHERE id_persona = $1';

    var rawResult = await sails.sendNativeQuery(sql, [usuario]);

    res.send(rawResult.rows);
  },

  produccion: async function (req, res) {
    var usuario = req.query.usuario;

    var sql = 'SELECT * from vista_asignaciones WHERE  id_persona = $1 AND (estado=2 OR estado=3) ';

    var rawResult = await sails.sendNativeQuery(sql, [usuario]);

    res.send(rawResult.rows);
  },

  finalizadas: async function (req, res) {
    var usuario = req.query.usuario;

    var sql = 'SELECT * from vista_asignaciones WHERE estado=4 AND aprobado=0 AND id_persona = $1';

    var rawResult = await sails.sendNativeQuery(sql, [usuario]);

    res.send(rawResult.rows);
  },

  iniciarTarea: async function (req, res) {
    var asignacion = req.query.asignacion
    var sql = 'UPDATE asignacion SET hora_inicio_real = $1, estado = 2 WHERE id = $2 AND estado = 1'
    var rawResult = await sails.sendNativeQuery(sql, [Date.now(), asignacion]);

    var sql2 = 'select * from  vista_asignaciones where id = $1 LIMIT 1'
    var rawResult2 = await sails.sendNativeQuery(sql2, [asignacion]);

    var asg = rawResult2.rows[0]
    var usuario = await Usuario.findOne({ persona: rawResult2.rows[0].cliente })
    sails.sockets.blast('Received message', { data: {} });

    firebase.messaging().sendToDevice(usuario.fcm, {

      notification: {
        title: asg.producto,
        body: 'Esta tarea ha sido iniciada',
        sound: "default",
        color: '#282C40'
      },


    })
      .then((response) => {
        console.log(response)
        return true
      })
      .catch((error) => {
        console.log(error)
        return false
      })

   

    res.send(rawResult);
  },

  aprobarTarea: async function (req, res) {
    var asignacion = req.query.asignacion
    var sql = 'UPDATE asignacion SET aprobado = 1 WHERE id = $1 AND estado = 4 AND aprobado = 0'
    var rawResult = await sails.sendNativeQuery(sql, [asignacion]);

    var sql2 = 'select * from  vista_asignaciones where id = $1 LIMIT 1'
    var rawResult2 = await sails.sendNativeQuery(sql2, [asignacion]);

    var asg = rawResult2.rows[0]
    var usuario = await Usuario.findOne({ persona: rawResult2.rows[0].cliente })
    sails.sockets.blast('Received message', { data: {} });

    firebase.messaging().sendToDevice(usuario.fcm, {

      notification: {
        title: asg.producto,
        body: 'Esta tarea ha sido finalizada',
        sound: "default",
        color: '#282C40'
      },


    })
      .then((response) => {
        console.log(response)
        return true
      })
      .catch((error) => {
        console.log(error)
        return false
      })

    res.send(rawResult);
  },

  desaprobarTarea: async function (req, res) {
    var asignacion = req.query.asignacion
    var sql = 'UPDATE asignacion SET estado = 2 WHERE id = $1 AND estado = 4 AND aprobado = 0'
    var rawResult = await sails.sendNativeQuery(sql, [asignacion]);
    
    var sql2 = 'select * from  vista_asignaciones where id = $1 LIMIT 1'
    var rawResult2 = await sails.sendNativeQuery(sql2, [asignacion]);
    var asg = rawResult2.rows[0]


    var pausaCreated = await Pausa.create({hora_inicio : asg.hora_finalizacion, hora_finalizacion: Date.now(), asignacion: asignacion}).fetch();

    res.send(rawResult);
  },

  finalizarTarea: async function (req, res) {
    var asignacion = req.query.asignacion
    var sql = 'UPDATE asignacion SET hora_finalizacion = $1, estado = 4 WHERE id = $2 AND estado = 2'
    var rawResult = await sails.sendNativeQuery(sql, [Date.now(), asignacion]);
    sails.sockets.blast('Received message', { data: {} });
    res.send(rawResult);
  },

  pausarTarea: async function (req, res) {

    var motivo = req.query.motivo
    var asignacion = req.query.asignacion
    var sql = 'UPDATE asignacion SET estado = 3 WHERE id=$1  AND estado = 2'
    var rawResult = await sails.sendNativeQuery(sql, [asignacion]);

    if (rawResult.affectedRows > 0) {

      var sqlInsert = 'INSERT INTO pausa(hora_inicio,  asignacion, motivo) VALUES ($1, $2, $3)'
      var rawResultInsert = await sails.sendNativeQuery(sqlInsert, [Date.now(), asignacion, motivo]);
      console.log(rawResultInsert)
      sails.sockets.blast('Received message', { data: {} });
      res.send(rawResultInsert)
    } else {
      sails.sockets.blast('Received message', { data: {} });
      res.send(rawResult);
    }
  },

  reanudarTarea: async function (req, res) {

    var pausa = req.query.pausa
    var asignacion = req.query.asignacion
    var sql = 'UPDATE asignacion SET estado = 2 WHERE id=$1  AND estado = 3'
    var rawResult = await sails.sendNativeQuery(sql, [asignacion]);

    if (rawResult.affectedRows > 0) {

      var sqlInsert = 'UPDATE pausa SET hora_finalizacion = $1 WHERE id=$2'
      var rawResultInsert = await sails.sendNativeQuery(sqlInsert, [Date.now(), pausa]);
      console.log(rawResultInsert)
      sails.sockets.blast('Received message', { data: {} });
      res.send(rawResultInsert)
    } else {
      sails.sockets.blast('Received message', { data: {} });
      res.send(rawResult);
    }
  }

};

