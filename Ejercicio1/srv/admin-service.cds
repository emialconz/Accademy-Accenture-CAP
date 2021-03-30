using { myLibreria as my } from '../db/schema';

service api {
    entity Libros as SELECT from my.Libros{*,        
    };
    entity Autores as SELECT from my.Autores{*,
    };
    entity Log as SELECT  from my.Log{*,
    };
}