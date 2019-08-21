/**
 * OrdenTrabajoController
 *
 * @description :: Server-side actions for handling incoming requests.
 * @help        :: See https://sailsjs.com/docs/concepts/actions
 */

module.exports = {
  count: async function (req, res) {
    var query = req.query
    if (query.where) {
      query.where = JSON.parse(query.where)
    }
    var count = await OrdenTrabajo.count(query)
    return res.json({
      count: count
    });
  },

  generarCarrito: async function (req, res) {
    
    var cliente = req.body.cliente;
    var productos = req.body.productos

   var orden = await OrdenTrabajo.create({cliente: cliente, fecha_emision: new Date(), fecha_vencimiento: new Date()}).fetch()

   if(orden.id){
    productos.forEach(producto => {
      producto.orden = orden.id;
      producto.cantidad = 1;
      delete producto['id'];
    });
 

   var prods = await OrdenProducto.createEach(productos).fetch();

  
   }

   
    res.json({sd: true})
  },

 


};
