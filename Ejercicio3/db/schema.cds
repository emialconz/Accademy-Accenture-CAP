namespace myLibreria;

using { cuid } from '@sap/cds/common';

entity Libros {
    key ID: UUID;
    Name: String(40);
    nombre_autor: String(40);
    autor: Association to Autores;
}

entity Autores {
    key ID: UUID;
    Name: String(40);
    PaisNacimiento: String(40);
    libro: Association to many Libros on libro.autor = $self;
} 