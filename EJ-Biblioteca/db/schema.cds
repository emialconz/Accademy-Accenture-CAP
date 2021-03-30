namespace myBiblioteca;

using { cuid, managed } from '@sap/cds/common';

//Type de las entidades
type NameString: String(30);

entity Libros : cuid, managed {
    Name: NameString;//@mandatory
    fecha_pub: Date;
    editoriales: Association to Editoriales;//@mandatory
    autor: Association to Autores;//@mandatory
    clientes: Association to Clientes; 
    puntaje: Integer;//@mandatory
    criticas: array of String(500);
}

entity Clientes : cuid, managed{
    Name: NameString;//@mandatory
    fecha_nac: Date;//@mandatory
    DNI: Integer;// @mandatory//nose tiene que mostrar en el servicio
    libros_comp: Association to many Libros on libros_comp.clientes = $self; //relacion de uno a muchos
    usuario: Composition of many Usuarios on usuario.parent = $self;
}

entity Usuarios : cuid {
    key parent: Association to Clientes;
    Name: NameString;//@mandatory
    password: NameString;//@mandatory
    email: array of {
        tipo: String(200);
        words: String(200);
    }; 
    puntos: Integer;
    estado: Integer enum {
        activo    = 1;
        baja      = 2;
        pendiente = 3;
    };
}

entity Autores : cuid {
    Name: NameString;//@mandatory
    genero: String(20) default 'Novela';
    fecha_nac: Date;//@mandatory//nose tiene que mostrar en el servicio
    nacionalidad: String(30);
    cant_li_pub: Integer;
    venta_dir: Boolean;//nose tiene que mostrar en el servicio
    editorial: Association to many Editoriales on editorial.autores = $self;//uno a muchos
}

entity Editoriales : cuid {
    Name: NameString;
    nacionalidad: NameString;
    autores: Association to Autores;
}