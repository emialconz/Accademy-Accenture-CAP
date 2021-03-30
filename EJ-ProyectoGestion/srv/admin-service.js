const cds = require("@sap/cds");

const { Tecnologias, Proyectos } = cds.entities;


module.exports = cds.service.impl(async (srv) => {
    srv.after('CREATE', 'Proyectos', async (req) => {
        try {
            console.log("Empezando a analizar para la estimacion del costo de proyecto")
            const techID = req.tecnologia_ID;
            console.log("Todo bien hasta aca!");
            let tech = await cds.run(SELECT.one(Tecnologias).where({ ID: techID }));
            let costo = (tech.costoPorDia)*(tech.TiempodelProy);
            console.log(tech);
            /*--------------------console.logs para probar que todo esta bien----------------------*/
            //console.log(costo);
            //console.log(tech.costoPorDia);
            //console.log(tech.TiempodelProy);
            //console.log(tech.nivelDificultad);
            //console.log("vamos a entrar al switch");
            switch (tech.nivelDificultad){
                case 1:
                    console.log("Si realizamos una estimacion con la dificultad de NIVEL 1 en" + tech.TiempodelProy  +" que es lo que dura el proyecto en meses, el costo seria: $" + costo);
                    break;
                case 2:
                    console.log("Si realizamos una estimacion con la dificultad de NIVEL 2 en" + tech.TiempodelProy + " que es lo que dura el proyecto en meses, el costo seria: $ " + costo * 2);
                    break;
                case 3:
                    console.log("Si realizamos una estimacion con la dificultad de NIVEL 2 en" + tech.TiempodelProy + " que es lo que dura el proyecto en meses, el costo seria: $ " + costo * 3);
                    break;
                default:
                    console.log("No realizamos un estimacion para esta opcion, eliga otra");
                    break;
            };
            console.log("Se pudo calcular el costo del proyecto!");
        } catch(err){
            console.log(err);
            return "Algo salio mal!";
        } 
    })
});