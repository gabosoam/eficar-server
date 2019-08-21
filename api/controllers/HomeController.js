module.exports = {


    count: async function (req, res) {

        var clienteCount = await Persona.count({ es_cliente: true, estado: true })
        var productoCount = await Producto.count({ estado: true })
        var cotizacionCount = await Cotizacion.count()
        var ordenTrabajoCount = await OrdenTrabajo.count()
        return res.json({
            clienteCount: clienteCount,
            productoCount: productoCount,
            cotizacionCount: cotizacionCount,
            ordenTrabajoCount: ordenTrabajoCount
        });
    },

};