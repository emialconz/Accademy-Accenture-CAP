namespace myLibreria;

using { cuid, managed } from '@sap/cds/common';

entity Libros : cuid {
    //key ID: UUID;
    Name: String(40);
    autor: Association to Autores;
}

entity Autores : cuid {
    //key ID: UUID;
    Name: String(40);
    PaisNacimiento: String(40);
    libro: Association to many Libros on libro.autor = $self;
}

entity Log : cuid, managed {
    idlibro: String(100);
    metodo: String(10);
    mensaje: String(150);
}