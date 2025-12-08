var database = require("../database/config");

function buscarSetor(idEmpresa, setor) {
    const setorTratado = setor ? setor.replace(/'/g, "''") : null;

    let sql = 
        `SELECT 
            c.valor AS valor,
            c.dtRegistro AS data,
            s.setor AS setor
        FROM captura c
        JOIN sensor s ON c.fkSensor = s.idSensor
        WHERE s.fkEmpresa = ${idEmpresa}`
    ;

    if (setorTratado) {
        sql +=  `AND s.setor = '${setorTratado}'`;
    }

    sql += 
       ` ORDER BY c.dtRegistro DESC, c.idCaptura DESC
        LIMIT 200;`
    ;

    console.log("Consulta setores:", sql);
    return database.executar(sql);
}

module.exports = {
    buscarSetor
};
