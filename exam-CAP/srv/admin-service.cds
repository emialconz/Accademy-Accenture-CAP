using {NorthWind as my} from '../db/schema';

service ServicioGeneral {
    entity Productos as projection on my.Productos;
    entity Ordenes as projection on my.Ordenes;
    entity OrdenDetalles as projection on my.OrdenDetalles;

    entity vistaProductos as select from Productos{*,
        ProductID, ProductName, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
    };
    
}