using { gestionDisquera as gestionDisquera } from '../db/schema';

service api {
    entity Musicos as SELECT from gestionDisquera.Musicos {*};
    entity Bandas as SELECT from gestionDisquera.Bandas{*};
    entity Discos as SELECT from gestionDisquera.Discos{*};
    entity Centros as SELECT from gestionDisquera.Centros{*};
}