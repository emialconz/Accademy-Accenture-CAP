using { myLibreria as my } from '../db/schema';

service api {
    entity Libros as SELECT from my.Libros{*,
        autor.Name as autor_Name        
    };
    entity Autores as SELECT from my.Autores{*,
    };
    entity Inventario as SELECT from my.Inventario{*,
        libro.Name,
        libro.autor.ID,
        libro.autor.Name as autor_Name
    };
    action modInventario(libro : Libros : ID, cantidad : Integer) returns String;
    action insertOrder(libro : array of my.Inventario) returns String; 
}