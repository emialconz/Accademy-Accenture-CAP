namespace ges_Tienda;

using { cuid } from '@sap/cds/common';

entity Tiendas : cuid {
    Name: String(40);
    propietarios: Association to many Propietarios_Tiendas on propietarios.tienda = $self;
    productos: Association to many Tiendas_Productos on productos.tienda = $self;
}

entity Propietarios : cuid {
    Name: String(40);
    tiendas: Association to many Propietarios_Tiendas on tiendas.propietario = $self;
}
 
entity Productos : cuid {
    Name: String(40);
    maxStock: Integer;
    minStock: Integer;
    marca: Association to Marcas;
    tienda: Association to many Tiendas_Productos on tienda.productos = $self;
    precio: Association to Precio;
}

entity Marcas : cuid {
    nombre: String(40);
    pais: String(40);
    productos: Association to many Productos on productos.marca = $self;
}

entity Precio : cuid {
    valor: String(40);
    productos: Association to many Productos on productos.precio = $self;
}


entity Propietarios_Tiendas : cuid {
    key propietario: Association to Propietarios;
    key tienda: Association to Tiendas;
}

entity Tiendas_Productos : cuid {
    key tienda: Association to Tiendas;
    key productos: Association to Productos;
    stock: Integer;
}
 