using { misAutos as my } from '../db/schema';

service api {
    entity Marcas as SELECT from my.Marcas{*,
    };
    entity Modelos as SELECT from my.Modelos{*,
    }
    
}