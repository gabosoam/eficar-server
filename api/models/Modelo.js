module.exports = {
  attributes: {
    id: { type: 'number', autoIncrement: true },
    estado: {type: 'boolean', defaultsTo: true},
    nombre: { type: 'string' },
    anio: { type: 'string' },
    marca: { model: 'marca', required: true },
    tipo: { model: 'tipo', required: true },
    vehiculos: {collection: 'vehiculo', via: 'modelo'}
  },

  customToJSON: function() {
    if(this.marca){
      this.marca = this.marca.id
    }

    if(this.tipo){
      this.tipo = this.tipo.id
    }
    
    return this
  },
  
  primaryKey: 'id'
};

