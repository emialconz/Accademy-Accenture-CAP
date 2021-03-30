const cds = require("@sap/cds");

module.exports = cds.server;

cds.on('bootstrap', ()=>{console.log("paso por bootstrap")});
cds.on('served', ()=>{console.log("paso por served")});