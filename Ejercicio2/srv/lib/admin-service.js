const cds = require("@sap/cds");

const { Tiendas, Productos, Precio } = cds.entities;

module.exports = cds.service.impl(async(srv)=>{

    srv.on('ActualizarPrecio', async (req) => {

        const {ID,valor} = req.data.Precio;
        console.log(valor, ID, Precio);
        console.log('Actualizando precio!');

        try {
            await cds.run(UPDATE(Precio).set({valor: req.data.Precio.valor})).where({ID: req.data.Precio.ID});
            return 'OK';
        }catch(error){
            console.log('Error mientras se actualizaba el precio');
        }
    });


});