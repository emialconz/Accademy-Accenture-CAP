using { myRedSocial as my } from '../db/schema';

service api {
    entity Usuarios as SELECT from my.Usuarios;
    entity Mensajes as SELECT from my.Mensajes;
    entity Perfiles as SELECT from my.Perfiles;
    entity Publicaciones as SELECT from my.Publicaciones;
    entity Comentarios as SELECT from my.Comentarios;

    entity vista_UsuarioPublicaciones as select FROM Usuarios{*,
        userName as Name,
        publicaciones.titulo as publicaciones_Name,
    }; // where tipo.Name = 'Leche' 

    entity vista_UsuariosArg as select from Usuarios[paisOrigen = 'ARG']{*
    } where amigos > 200;

    entity vista_compartida as select from Publicaciones{*,
        titulo as titulo,
        usuario.userName as nombre,
    } where compartido >100;

}