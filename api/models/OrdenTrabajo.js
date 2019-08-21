module.exports = {
  attributes: {
    id: { type: 'number', autoIncrement: true },
    fecha_emision: {type: 'string', required: false},
    cliente: {model: 'persona'},
    vehiculo: {model: 'vehiculo'},
    vendedor: {model: 'persona'},
     variantes:{
      collection: 'tipoProducto',
      via: 'orden',
      through: 'ordenProducto'
    }
  },
  primaryKey: 'id',
  
  
  customToJSON: function() {
    if(this.cliente.id){
      this.cliente = this.cliente.id
    }

    if(this.vehiculo.id){
      this.vehiculo = this.vehiculo.id
    }
    
    return this
  },


  beforeCreate: function (valuesToSet, proceed) {
  
    valuesToSet.fecha_emision =  new Date()

    proceed();
  }
};

