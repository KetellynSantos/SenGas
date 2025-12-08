var database = require("../database/config");

function listar(idEmpresa){
    const consultaSql = `SELECT * FROM vw_limite where empresa = ${idEmpresa};
 `;
    
    return database.executar(consultaSql);
}

module.exports = {
    listar
};