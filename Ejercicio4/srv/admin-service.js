/*let cds = require("@sap/cds");
let { Inventario } = cds.entities;

module.exports = cds.service.impl(async (srv) => {
    srv.on('modInventario', async req => {
        try {
            console.log("Modificanco el Inventario")
            let { libros, cantidad } = req.data
            let aLibros = await cds.run(SELECT.from(Inventario).where({ libro_ID: libro }))
            if (aLibros.length > 0){
                console.log("Antes del Update")
                await cds.run(SELECT(Inventario).with({ cantidadLibro: {'+=': amount} }).where({libro_ID: book}));
                console.log(`Se actualizo ${libro}`)
                return "Todo OK"
            }else{
                console.log("No figura en el Inventario")
                return "No se inserto, no hay para actualizar"
            }
        } catch(error) {
            console.log(error)
            console.log("Error al actualizar")
        }
    })
})*/