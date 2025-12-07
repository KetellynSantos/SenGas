var database = require("../database/config");

function buscarSetor(idEmpresa, setor) {
    const sql = `
        SELECT valor, momento
        FROM medida
        WHERE fkEmpresa = ${idEmpresa}
        AND setor = '${setor}'
        ORDER BY momento DESC;
    `;
    return database.executar(sql);
}

module.exports = {
    buscarSetor
};
