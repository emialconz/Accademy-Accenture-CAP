namespace myRedSocial;

using { cuid, managed } from '@sap/cds/common';

//Type de las entidades
type TypeString: String(30);
//Aspect de la entidad usuario
aspect Usuario_Humano : cuid {
    Name: TypeString;//@mandatory 
    apellido: TypeString;//@mandatory 
    paisOrigen: String(3);
    genero: Integer enum {
        Femenino = 1;
        Masculino = 2;
        Otro = 3;
    };
    fecha_nac: Date; //@mandatory 
    email: array of{
        usuario: TypeString;
        dominio: TypeString;
        full: TypeString;
    }
}

entity Usuarios : Usuario_Humano {
    userName: TypeString; //@mandatory
    password: TypeString; //@mandatory 
    amigos: Integer;
    status: Boolean;
    mensajes: Composition of many Mensajes on mensajes.parent = $self;
    publicaciones: Association to many Publicaciones on publicaciones.usuario = $self;
    comentarios: Association to many Comentarios on comentarios.usuario = $self;
    perfil: Association to Perfiles;
}

entity Mensajes : cuid {
    key parent: Association to Usuarios;    
    Name_reminente: TypeString; //@mandatory 
    contenido: TypeString;
    leido: Boolean;
    mutimedia: array of {
        tipo: String;
        tamano: Decimal(7, 3)
    }
}

//uno a muchos (publicaciones) 
entity Perfiles : cuid {
    titulo: TypeString;
    descripcion: String(250);
    visualizaciones: Integer;
    antiguedad: Integer enum {
        Bronce = 1;
        Plata = 2;
        Oro = 3;
        Diamante = 4;
        Carbon = 0;
    };
    usuario: Association to Usuarios;
    publicaciones: Association to many Publicaciones on publicaciones.perfil =$self;
}

//relacion de uno a muchos- un solo usuario un solo perfil y muchos comments
entity Publicaciones : cuid, managed {
    titulo: TypeString default 'titulo';
    compartido: Integer;
    tipo: Integer enum {
        Texto = 1;
        Foto = 2;
        Video = 3;
        URL = 5;
    };
    vista_previa: Boolean;
    likes: Integer;
    usuario: Association to Usuarios;
    perfil: Association to Perfiles;
    comentarios: Association to many Comentarios on comentarios.publicacion = $self;
}

//asociado a un usuario y una publicacion
entity Comentarios : cuid, managed { 
    Name: TypeString;
    contenido: String(300);
    publicacion: Association to Publicaciones;
    usuario: Association to Usuarios;
}

