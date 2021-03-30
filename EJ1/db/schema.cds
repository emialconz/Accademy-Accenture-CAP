namespace misAutos;

using { cuid } from '@sap/cds/common';

entity Autos : cuid {
    Name: String(40);
    Country: String(40);
    Comentario: String(40);
}