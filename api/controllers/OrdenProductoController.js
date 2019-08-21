/**
 * OrdenProductoController
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
        var count = await OrdenProducto.count(query)
        return res.json({ count: count });
      },

      vista: async function (req, res) {
        var orden = req.query.orden;
    
        var sql = 'SELECT * from vista_ordenes where orden = $1';
    
        var rawResult = await sails.sendNativeQuery(sql, [orden]);
    
        res.send(rawResult.rows);
      },
};

