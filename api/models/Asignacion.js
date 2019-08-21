module.exports = {

  attributes: {
    id: {
      type: 'number',
      autoIncrement: true
    },
    estado: {
      type: 'number',
      defaultsTo: 1
    },
    aprobado: {
      type: 'boolean',
      defaultsTo: false
    },
    tarea: {
      model: 'ordenProducto',
      unique: true,
      required: true
    },
    operador: {
      model: 'persona'
    },
    hora_inicio: {
      type: 'string'
    },
    hora_inicio_real: {
      type: 'string'
    },
    hora_finalizacion: {
      type: 'string'
    },
    pausas: {
      collection: 'pausa',
      via: 'asignacion'
    }
  },

  primaryKey: 'id',

  afterCreate: function (data, cb) {

    sails.sockets.blast('Received message', { data: data});
    cb();
  },

  afterUpdate: function (data, cb) {

    sails.sockets.blast('Received message', { data: data });
    cb();
  },

  afterDestroy: function (data, cb) {

    sails.sockets.blast('Received message', { data: data });
    cb();
  }

};
