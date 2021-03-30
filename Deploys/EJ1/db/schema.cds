namespace miLibreria;

entity Libros {
    key ID: Integer;
    Name: String(40);
    Stock: Integer;
    autor: Association to Autores;
}

entity Autores {
    key ID: Integer;
    Name: String(40);
    PaisNacimiento: String(40);
    libro: Association to many Libros on libro.autor = $self;
}

entity Log {
    idlibro: String(100);
    metodo: String(10);
    mensaje: String(150);
}