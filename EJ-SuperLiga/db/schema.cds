namespace miSuperLiga;

using { cuid, managed } from '@sap/cds/common';

//Type de las entidades
type TypeString: String(30);

entity Partidos : cuid, managed {
    arbitro: TypeString; //@mandatory 
    capacidad: Integer;
    relator: TypeString;
    fechaPartido: Date;
    clasico: Boolean;
    estadio: Association to Estadios;
    equipoLocal: Association to Equipos;
    equipoVisitante: Association to Equipos;
    puntaje: Association to Puntajes;
    resultado: Composition of many Resultados on resultado.parent =$self
}

entity Resultados : cuid { 
    key parent: Association to Partidos;   
    resultadoLocal: Integer;
    resultadoVisitante: Integer;
}


entity Equipos : cuid {   
    nombre: TypeString; 
    division: TypeString;
    puntos: Integer;
    cantidadJugadores: Integer;
    presupuesto: Integer;
    //uno a muchos partidos
    partidos: Association to many Partidos on partidos.equipoLocal = $self or partidos.equipoVisitante = $self;
    jugadores: Composition of many Jugadores on jugadores.parent =$self;
    estadio: Association to Estadios;
}

entity Jugadores : cuid {
    key parent: Association to Equipos;   
    nombre: TypeString;
    valor: Integer;
    nameCamiseta_Apodo: String(250);
    posionJuego: String;
    paisOrigen: String;
    numRemera: Integer;
    puntaje: Association to many Puntajes on puntaje.jugador = $self;
    equipo: Association to Equipos;
}

entity Estadios : cuid { 
    nombre: TypeString;
    direccion: TypeString;
    contenido: String;
    capacidad: Integer;
    partidos: Association to many Partidos on partidos.estadio = $self;
    equipos: Association to many Equipos on equipos.estadio = $self;
}

entity Puntajes : cuid, managed {
    asistencias: Integer;
    goles: Integer;
    salvadas: Integer;
    jugador: Association to Jugadores;
    partido: Association to Partidos;
}

