using {NorthWind as my} from '../db/schema';

@(path: '/ServicioGeneral')
service ServicioGeneral {
    entity Productos as projection on my.Productos;
    @readonly
    entity Ordenes as projection on my.Ordenes;
    entity OrdenDetalles as projection on my.OrdenDetalles;

    entity vistaProductos as select from Productos{*,
        ProductID, ProductName, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
    };
    
}
@(path: '/ServicioProductos')
service ServicioProductos @(requires :'Scope1') {
    @readonly
    entity Productos as projection on my.Productos;
    entity Ordenes as projection on my.Ordenes;
    entity OrdenDetalles as projection on my.OrdenDetalles;
}

@(path: '/ServicioOrdenes')
service ServicioOrdenes @(requires :'Scope1') {
    @readonly entity Productos as projection on my.Productos;
    entity Ordenes as projection on my.Ordenes;
    @readonly entity OrdenDetalles as projection on my.OrdenDetalles;
}