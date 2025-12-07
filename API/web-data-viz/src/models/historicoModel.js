var database = require("../database/config");

function listar(){
    const consultaSql = `SELECT * FROM vw_limite;
 `;
    
    return database.executar(consultaSql);
}

module.exports = {
    listar
};