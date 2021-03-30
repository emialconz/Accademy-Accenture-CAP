using { cuid } from '@sap/cds/common';
namespace myTienda;

entity Productos: cuid {
    //key ID: UUID;
    Name: String(40);
    precio: Association to Precio;
    canProductos: Integer;
    tiendas: Association to many Tiendas_Productos on tiendas.productos = $self;
}

entity Tiendas: cuid {
    //key ID: UUID;
    Name: String(40);
    productos: Association to many Tiendas_Productos on productos.tiendas = $self;
}

entity Precio : cuid {
    valor: Integer;
    productos: Association to many Productos on productos.precio = $self;
}

entity Tiendas_Productos {
    key tiendas : Association to Tiendas;
    key productos : Association to Productos;
} 