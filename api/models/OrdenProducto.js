module.exports = {
  attributes: {
    orden: {
      model: 'ordenTrabajo'
    },
    variante: {
      model: 'tipoProducto'
    },
    porsentaje_iva: { type: 'number' },
    cantidad: { type: 'number' },
    precio: { type: 'number' },
    tiempo_estandar: { type: 'number' },
    porcentaje_descuento: { type: 'number' },
    descripcion: { type: 'string' },
    base_cero: { type: 'number' },
    asignaciones: {collection: 'asignacion', via: 'tarea'}
  },
}
