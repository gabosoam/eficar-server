
module.exports = {
  
  count: async function (req, res) {
    var query = req.query
    if (query.where) {
      query.where = JSON.parse(query.where)
    }
    var count = await Motivo.count(query)
    return res.json({ count: count });
  },


};

