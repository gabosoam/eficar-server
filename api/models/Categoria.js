module.exports = {
  attributes: {
    id: { type: 'number', autoIncrement: true },
    estado: {type: 'boolean', defaultsTo: true},
    nombre: { type: 'string', required: true, unique: true },
    productos: {collection: 'producto', via: 'categoria'}
  },
  primaryKey: 'id'
};

