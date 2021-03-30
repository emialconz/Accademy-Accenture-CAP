using { myBiblioteca } from '../db/schema';

service api {
    entity Libros as SELECT from myBiblioteca.Libros{*};
    entity Clientes as SELECT from myBiblioteca.Clientes{*};
    entity Usuarios as SELECT from myBiblioteca.Usuarios{*};
    entity Autores as SELECT from myBiblioteca.Autores{*};
    entity Editoriales as SELECT from myBiblioteca.Editoriales{*};
}