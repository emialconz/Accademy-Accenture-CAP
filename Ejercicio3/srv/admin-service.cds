using { myLibreria as my } from '../db/schema';

service api {
    entity Libros as SELECT from my.Libros{*,
        autor as autor_nombre        
    };
    entity Autores as SELECT from my.Autores{*,
    };

}