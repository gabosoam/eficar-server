module.exports = {
  attributes: {
    id: { type: 'number', autoIncrement: true },
    estado: { type: 'boolean', defaultsTo: true },
    identificacion: { type: 'string', required: true, unique: true},
    nombre: { type: 'string' },
    direccion: { type: 'string' },
    telefono: { type: 'string' },
    email: { type: 'string', email: true },
    es_cliente: { type: 'boolean', defaultsTo: true },
    es_empleado: { type: 'boolean', defaultsTo: false },

    es_administrador: { type: 'boolean', defaultsTo: false },
    es_asesor: { type: 'boolean', defaultsTo: false },
    es_jefe: { type: 'boolean', defaultsTo: false },
    es_operador: { type: 'boolean', defaultsTo: false },



    vehiculos: { collection: 'vehiculo', via: 'propietario' },
    cotizaciones: { collection: 'cotizacion', via: 'cliente' },
    cotizaciones_realizadas: { collection: 'cotizacion', via: 'vendedor' },
    usuario: { collection: 'usuario', via: 'persona' },
    asignaciones: {collection: 'asignacion', via: 'operador'},
    carrito: {
      collection: 'carrito', via: 'persona'
    }
  },
  primaryKey: 'id',

};

