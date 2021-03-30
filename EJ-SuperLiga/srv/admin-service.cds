using { miSuperLiga as my } from '../db/schema';

service api {
    entity Partidos as SELECT from my.Partidos;
    entity Resultados as SELECT from my.Resultados;
    entity Equipos as SELECT from my.Equipos;
    entity Jugadores as SELECT from my.Jugadores;
    entity Estadios as SELECT from my.Estadios;
    entity Puntajes as SELECT from my.Puntajes;

    entity vistaGoles as select FROM Jugadores{*,
        puntaje.partido.ID as partido_ID,
        puntaje.goles,
    } where puntaje.goles >= 3;

    entity vistaPartido as select FROM Partidos{*,
        equipoVisitante.nombre as visitante,
        resultado.resultadoVisitante as golesVisitantes,
        equipoLocal.nombre as local,
        resultado.resultadoLocal as golesLocal,
    } where (resultado.resultadoVisitante - resultado.resultadoLocal >= 3) or (resultado.resultadoLocal-resultado.resultadoVisitante >= 3);
    
    entity vistaArqueroSalvadas as select FROM Jugadores{*,
        puntaje.salvadas as salvadas
    } where posionJuego = 'Arquero' order by salvadas desc limit 1;
    
}