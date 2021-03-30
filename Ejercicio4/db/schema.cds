namespace myLibreria;

using { cuid, managed } from '@sap/cds/common';

entity Libros : cuid {
    Name: String(40);
    autor: Association to Autores;
    comment: String(40);
}

entity Autores : cuid {
    Name: String(40);
    PaisNacimiento: String(40);
    libro: Association to many Libros on libro.autor = $self;
}
entity Inventario : cuid, managed {
    libro : Association to Libros;
    cantidad : Integer;
    price : Decimal(3, 2);
    comment : String(40);
} 