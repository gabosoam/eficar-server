
module.exports = {

  attributes: {
    tipo:{
      model:'tipo'
    },
    producto: {
      model: 'producto'
    },
    pvp: {type: 'number'},
    estado: {type: 'boolean', defaultsTo: true},
    tiempoEstandar: {type: 'number'},

    cotizaciones: {
      collection: 'cotizacion',
      via: 'variante',
      through: 'cotizacionProducto'
    },

    ordenes: {
      collection: 'ordenTrabajo',
      via: 'variante',
      through: 'ordenProducto'
    },

    carrito: {
      collection: 'carrito', via: 'tipoProducto'
    }
  }

};

