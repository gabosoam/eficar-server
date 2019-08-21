module.exports = {

  attributes: {

    id: {
      type: 'number',
      autoIncrement: true
    },

    hora_inicio: {
      type: 'string'
    },

    hora_finalizacion: {
      type: 'string'
    },

    asignacion: {
      model: 'asignacion'
    },

    motivo:{
      model: 'motivo'
    }

  },

  primaryKey: 'id'

};
