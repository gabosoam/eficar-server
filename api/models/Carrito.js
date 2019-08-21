
module.exports = {

  attributes: {



    id: { type: 'number', autoIncrement: true },

    persona: { model: 'persona' },

    vehiculo: { model: 'vehiculo' },

    tipoProducto: { model: 'tipoProducto' }

   

  },

};

