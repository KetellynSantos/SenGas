var database = require("../database/config");

function MedidasKpi(idEmpresa) {
    var instrucaoSql = `
        SELECT * FROM vw_kpis
        WHERE idEmpresa = ${idEmpresa};
    `;
    return database.executar(instrucaoSql);
}


function MedidasGrafico(idEmpresa) {
    var instrucaoSql = `
        SELECT * FROM vw_grafico 
        WHERE fkEmpresa = ${idEmpresa};
    `;
    return database.executar(instrucaoSql);
}

function buscarLimite(idEmpresa) {
    const sql = `
        SELECT limite
        FROM sensor
        WHERE fkEmpresa = ${idEmpresa}
        LIMIT 1;
    `;
    return database.executar(sql);
}

module.exports = {
    MedidasGrafico,
    MedidasKpi,
    buscarLimite
};
