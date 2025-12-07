var database = require("../database/config");

function listar(idEmpresa){
    const consultaSql = `SELECT * FROM vw_limite where sensor = ${idEmpresa};
 `;
    
    return database.executar(consultaSql);
}

module.exports = {
    listar
};