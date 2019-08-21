/**
 * CarritoController
 *
 * @description :: Server-side actions for handling incoming requests.
 * @help        :: See https://sailsjs.com/docs/concepts/actions
 */

module.exports = {
  
  vista: async function (req, res) {
  
    var propietario = req.query.propietario;

    var sql = 'SELECT * from vista_carrito where idPersona = $1';

    var rawResult = await sails.sendNativeQuery(sql, [propietario]);

    res.send(rawResult.rows);
  },
  

  

};

