const cds = require("@sap/cds");

const { Productos, OrdenDetalles } = cds.entities;

module.exports = cds.service.impl(async (srv) => {
    srv.before('CREATE', 'OrdenDetalles', async (req) => {
        console.log("Stock se puede usar");
        const cantidades = req.data;
        console.log(cantidades);
        const stock = await stockActual(cantidades);
        if (stock) {
            if(stock.stockAnterior < cantidades.UnitsInStock){
                return "Error el stock ha solicitar es mayor al diponible";    
            }else {
                try{
                    await cds.run(UPDATE('Productos').set({ UnitsOnOrder: { '+=': cantidades.UnitsInStock },UnitsInStock : {'-=': cantidades.UnitsInStock}}).where({ ProductID: cantidades.ProductID_ProductID }));
                }catch(err){
                    console.log(err);
                    return err;
                }
                return "Se pudo realizar su pedido, vuelva pronto!";
            }
        }else{
            console.log("FALLO");
        }
    });

    async function stockActual(cantidades){
        console.log("entrando a stockactual!");
        //console.log(cantidades.ProductID);
        console.log(cantidades);
        const stock = await cds.run(SELECT.one(Productos).where({ ProductID: cantidades.ProductID_ProductID }));
        if(stock) {
            stockenOrdenes = (stock.UnitsOnOrder + cantidades.UnitsInStock);
            return {
                stockAnterior: stock.UnitsInStock,
                stockActualmente: stockenOrdenes
            }
        }
    }
});