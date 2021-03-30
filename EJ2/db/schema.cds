namespace misAutos;

using { cuid } from '@sap/cds/common';

entity Marcas : cuid {
    Name: String(40);
    Country: String(40);
    Comentario: String(40);
    modelos: Composition of many Modelos on modelos.parent = $self;
}
entity Modelos : cuid {
    key parent : Association to Marcas;
    Name: String(40);
    Tipo: String(40);
}
