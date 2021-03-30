using { miLibreria as my } from '../db/schema';

@(path: '/ServicioGeneral')
service servicioGeneral @(requieres :'Scope1'){
    entity Libros as SELECT from my.Libros{*,        
    };
    @readonly
    entity Autores as SELECT from my.Autores{*,
    };
    entity Log as SELECT  from my.Log{*,
    };
}

@(path: '/ServicioAutores')
service servicioAutores @(requieres :'Scope2'){
    entity Libros as SELECT from my.Libros{*,        
    };
    @readonly
    entity Autores as SELECT from my.Autores{*,
    };
    entity Log as SELECT  from my.Log{*,
    };
}

@(path: '/ServicioLibros')
service servicioLibros {
    @readonly
    entity Libros as SELECT from my.Libros{*,        
    };
    entity Autores as SELECT from my.Autores{*,
    };
    entity Log as SELECT  from my.Log{*,
    };
}