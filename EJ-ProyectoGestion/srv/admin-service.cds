using { ProyectoGestion as my } from '../db/schema';

service api {
    entity Tecnologias as projection on my.Tecnologias;
    entity Proyectos as projection on my.Proyectos;
    
}