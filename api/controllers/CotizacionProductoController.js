/**
 * CotizacionProductoController
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
    var count = await CotizacionProducto.count(query)
    return res.json({ count: count });
  },

  vista: async function (req, res) {
    var cotizacion = req.query.cotizacion;

    var sql = 'SELECT * from vista_cotizaciones where cotizacion = $1';

    var rawResult = await sails.sendNativeQuery(sql, [cotizacion]);

    res.send(rawResult.rows)
  },


};

