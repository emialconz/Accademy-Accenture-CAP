namespace myDisquera;

using { cuid, managed } from '@sap/cds/common';

//Type de las entidades
type NameString: String(30);

entity Musicos : cuid, managed {
    Name: NameString;
    bandas: Association to many Bandas on bandas.musicos = $self;
    sesiones: Composition of many Sesiones on sesiones.parent = $self;
}

entity Sesiones : cuid, managed{
    key parent : Association to Musicos;
    num_sesiones :  Integer;
    HsGrabacion :   Integer;
    musico: Association to Musicos;
}

entity Bandas : cuid {
    Name: NameString;
    musicos: Association to Musicos;
    discos: Association to many Discos on discos.bandas = $self;
}

entity Discos : cuid {
    Name: NameString;
    bandas: Association to Bandas;
    centros: Association to many Centros on centros.discos = $self;
}

entity Centros : cuid {
    Name: NameString;
    discos: Association to Discos;
}



