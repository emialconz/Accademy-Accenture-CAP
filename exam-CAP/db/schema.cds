namespace NorthWind;

//using {cuid, managed} from '@sap/cds/common';


entity Productos {
    key ProductID : Integer;
    ProductName: String(40);
    QuantityPerUnit: String(40);
    UnitPrice: Integer;
    UnitsInStock: Integer;
    UnitsOnOrder: Integer;
    ReorderLevel: Integer;
    Discontinued: Boolean;

}

entity Ordenes {
    key OrderID: Integer;
    OrderDate: DateTime;
    RequiredDate: DateTime;
    ShippedDate: DateTime;
    ShipVia: Integer;
    Freight: Integer;
    ShipName: String(40);
    ShipAddress: String(40);
    ShipCity: String(40);
    ShipRegion: String(40);
    ShipPostalCode: Integer;
    ShipCountry: String(40); 
}

entity OrdenDetalles {
    key OrderID: Association to Ordenes;
    key ProductID : Association to Productos;   
    UnitsInStock: Integer;
}