var database = require("../database/config");

function MedidasKpi(idUsuario) {

    var instrucaoSql = `
    SELECT
    e.idEmpresa,
    (
        SELECT COUNT(*)
        FROM sensor s2
        WHERE s2.fkEmpresa = e.idEmpresa
    ) AS qtdSensores,

    COUNT(CASE WHEN c.valor > s.limite THEN 1 END) AS totalCapturasAcimaLimite,
    
    MAX(CASE WHEN c.valor > s.limite THEN c.valor END) AS maiorValorAcimaLimite,

    MAX(CASE WHEN c.valor > s.limite THEN c.dtRegistro END) AS ultimaCapturaAcimaLimite

FROM empresa e
JOIN sensor s ON s.fkEmpresa = e.idEmpresa
LEFT JOIN captura c ON c.fkSensor = s.idSensor
WHERE e.idEmpresa = ${idUsuario}
GROUP BY e.idEmpresa;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function  MedidasGrafico(idUsuario) {

    var instrucaoSql = `
   SELECT 
    e.idEmpresa,
    s.idSensor,
    c.valor,
    c.dtRegistro
FROM captura c
JOIN sensor s ON c.fkSensor = s.idSensor
JOIN empresa e ON s.fkEmpresa = e.idEmpresa
WHERE e.idEmpresa = ${idUsuario};
 `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    MedidasGrafico,
    MedidasKpi
}
