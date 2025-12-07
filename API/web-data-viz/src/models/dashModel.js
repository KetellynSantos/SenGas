var database = require("../database/config");

function MedidasKpi(idEmpresa) {
    var instrucaoSql = `
        SELECT
            e.idEmpresa,

            -- Último valor registrado
            (SELECT c.valor
                FROM captura c
                JOIN sensor s ON c.fkSensor = s.idSensor
                WHERE s.fkEmpresa = e.idEmpresa
                ORDER BY c.dtRegistro DESC, c.idCaptura DESC
                LIMIT 1
            ) AS ultimoValor,

            -- Quantidade de sensores ativos da empresa
            (SELECT COUNT(*) 
                FROM sensor s 
                WHERE s.fkEmpresa = e.idEmpresa
            ) AS qtdSensores,

            -- Total de capturas registradas pela empresa
            (SELECT COUNT(*)
                FROM captura c
                JOIN sensor s ON c.fkSensor = s.idSensor
                WHERE s.fkEmpresa = e.idEmpresa
            ) AS totalCapturas


        FROM empresa e
        WHERE e.idEmpresa = ${idEmpresa};
    `;
    return database.executar(instrucaoSql);
}



function MedidasGrafico(idEmpresa) {
    var instrucaoSql = `
        SELECT 
            c.valor,
            c.dtRegistro
        FROM captura c
        JOIN sensor s ON c.fkSensor = s.idSensor
        WHERE s.fkEmpresa = ${idEmpresa}
        ORDER BY c.dtRegistro DESC, c.idCaptura DESC

        LIMIT 50;
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
