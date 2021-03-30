using { misAutos as my } from '../db/schema';

service api {
    entity Autos as SELECT from my.Autos{*,
    };
    
}
