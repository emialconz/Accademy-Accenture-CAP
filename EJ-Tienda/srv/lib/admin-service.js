const cds = require("@sap/cds");

const { Tiendas, Productos, Precio, Propietarios, Propietarios_Tiendas } = cds.entities;

module.exports = cds.service.impl(async(srv)=>{

    /*Action para actualizar precios por conjunto de productos*/
    srv.on('actualizarPrecio', async (req) => {

        const {ID,valor} = req.data.precio;
        console.log(valor, ID);
        console.log('Actualizando precio!');

        try {
            console.log('Antes de actualizar el precio');
            await cds.run(UPDATE(Precio).set({valor:valor}).where({ID:ID}));
            return 'OK';
        }catch(error){
            console.log('Error mientras se actualizaba el precio');
            console.log(error)
            return 'Algo salio mal!'
        }
    });

    /*Cuando creo un dueño por url le paso las tiendas para q cree la relación*/

    srv.after('CREATE', 'Propietarios', async (data, req) => { 
        try {
            const propietarioID = req.data.ID;
            const { Tiendas } = req._.req.query;
            if (Tiendas) {
                const arrayTiendas = Tiendas.split(',');

                for (let tiendaID of arrayTiendas) {
                    await cds.run(INSERT.into(Propietarios_Tiendas).columns('propietario_ID', 'tienda_ID').values(propietarioID, tiendaID));
                }

                console.log("Se pudo armar la relacion");
            } else {
                console.log("No hay tiendas");
            }
        } catch (err) {
            console.log(err);
        }

    });

    /*Control de stock de productos: action q retira cantidades de productos y agrega cantidad, con id y cantidad. 
    Los productos tendrán un min y máximo q disparara alerta al llegar a los mismos.*/
});