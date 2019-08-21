module.exports = {
  attributes: {
    id: { type: 'number', autoIncrement: true },
    estado: { type: 'boolean', defaultsTo: true },
    codigo: { type: 'string', required: true, unique: true },
    categoria: { model: 'categoria' },
    nombre: { type: 'string', required: true, unique: true },
    descripcion: { type: 'string' },
    fotos: { collection: 'foto', via: 'producto' },
    iva: { type: 'string'},
    pvp_manual: { type: 'boolean', defaultsTo: true },
    tipos: {
      collection: 'tipo',
      via: 'producto',
      through: 'tipoProducto',
    },
  },
  primaryKey: 'id',

  customToJSON: function () {

    if (this.categoria) {
      this.categoria = this.categoria.id;
    }

    return this;
  },

 /*  afterCreate: async function (producto, proceed) {

    await Producto.update({ id: producto.id }).set({ tipos: [1, 2, 3, 4, 5, 6] });

    proceed();
  } */

};

