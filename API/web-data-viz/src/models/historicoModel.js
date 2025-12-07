var database = require("../database/config");

function listar(){
    const consultaSql = `SELECT 
    c.dtRegistro AS data,
    s.setor AS setor,
    c.valor AS valor,
    s.limite AS limite,
    CASE
        WHEN c.valor > s.limite THEN 'Acima do limite'
        WHEN c.valor < s.limite THEN 'Abaixo do limite'
        ELSE 'No limite'
    END AS status
    FROM captura c
    JOIN sensor s 
        ON c.fkSensor = s.idSensor
    ORDER BY c.dtRegistro DESC;
    `;
    
    return database.executar(consultaSql);
}

module.exports = {
    listar
};