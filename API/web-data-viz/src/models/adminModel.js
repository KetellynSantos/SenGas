var database = require("../database/config");

function listar() {
    const sql = `SELECT * FROM usuario;`;
    return database.executar(sql);
}

function deletar(idUsuario) {
    const sql = `DELETE FROM usuario WHERE id = ${idUsuario}`;
    return database.executar(sql);
}

module.exports = {
    listar,
    deletar
};

