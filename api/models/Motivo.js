module.exports = {

  attributes: {

    id: {
      type: 'number',
      autoIncrement: true
    },

    estado: {
      type: 'boolean',
      defaultsTo: true
    },

    descripcion: {
      type: 'string'
    },

    pausas: {
      collection: 'pausa',
      via: 'motivo'
    }

  },

};
