const cds = require("@sap/cds");

const { Productos, OrdenDetalle } = cds.entities;

module.exports = cds.service.impl(async (srv) => {
    srv.before('CREATE', 'OrdenDetalles', async (req) => {
        console.log("Stock se puede usar");
        const cantidades = req.data;
        const stock = await stockActual(cantidades);
        if (stock) {
            if(stock.stockAnterior < stock.stockActualmente)
            return "Error el stock ha solicitar es mayor al diponible";
        } else {
            return "Se pudo realizar su pedido, vuelva pronto!";
        }
    });

    async function stockActual(){
        const stock = await cds.run(SELECT.one.from(Productos).where({ ID: ProductID }));
        if(stock) {
            stockNow = (stock.UnitsOnOrder + UnitsInStock);
            return {
                stockAnterior: stock.UnitsOnOrder,
                stockActualmente: stockNow 
            }
        }
    }
});