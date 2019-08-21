module.exports = {
  attributes: {
    id: { type: 'number', autoIncrement: true },
    estado: {type: 'boolean', defaultsTo: true},
    placa: { type: 'string', required: true, unique: true },
    numero_motor: { type: 'string' },
    numero_chasis: { type: 'string' },
    anio_fabricacion: { type: 'string' },
    modelo: { model: 'modelo' },
    propietario: {model: 'persona'},

    carrito: {
      collection: 'carrito', via: 'vehiculo'
    }
  },
  primaryKey: 'id',

  customToJSON: function() {
    if(this.modelo){
      this.modelo = this.modelo.id
    }

    if(this.propietario){
      this.propietario = this.propietario.id
    }
    
    return this
  },
};
