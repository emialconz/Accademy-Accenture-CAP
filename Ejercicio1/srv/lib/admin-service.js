const cds = require("@sap/cds");

const { Log } = cds.entities;

module.exports = cds.service.impl(async(srv)=>{
    /*srv.on('insertOrder', async req =>{
        try{
            const {libro}=req.data;
            if(await cds.run(INSERT))
        }
    })
    srv.before('CREATE', 'Libros', async req => {
        console.log('Momentos antes de crear el libro');
        console.log(req.data)
    })

    srv.after('READ', 'Libros', async req => {
        console.log('el create del libro se ejecuto correctamente!')
    })

    srv.before('CREATE', 'Autores', async req => {
        console.log('Momentos antes de crear el autor');
        console.log(req.data)
    })

    srv.after('READ', 'Autores', async req => {
        console.log('el create del autor se ejecuto correctamente!')
    })*/

    srv.after('CREATE', 'Libros', (data, req) => {
        const log = {
            idlibro : data.ID,
            metodo : req.method,
            mensaje : "Libro creado con nombre: " + data.Name
        }

        console.log('la creacion del libro se ejecuto correctamente!')
        console.log(req.data);

        cds.run(INSERT.into(Log).entries(log));
    })

    

})