using { cuid, managed } from '@sap/cds/common';

namespace ProyectoGestion;

entity Tecnologias : cuid {
    name : String(50);
    costoPorDia: Integer;
    TiempodelProy: Integer;
    nivelDificultad: Integer enum {
        Baja = 1;
        Media = 2;
        Alta = 3;
    };
}

entity Proyectos : cuid {
    name : String(50);
    tecnologia : Association to Tecnologias;
}