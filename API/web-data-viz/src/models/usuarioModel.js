var database = require("../database/config")

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucaoSql = `
          SELECT 
            usuario.idUsuario,
            usuario.nome,
            usuario.email,
            usuario.nivelAcesso,
            empresa.idEmpresa,
            empresa.codigoEmpresa
        FROM usuario
        JOIN empresa 
            ON usuario.codigoEmpresa = empresa.codigoEmpresa
        WHERE usuario.email = '${email}' 
          AND usuario.senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function cadastrar(codigoEmpresa, nome, telefone, email, senha, nivelAcesso) {
    const sql = `
        INSERT INTO usuario (codigoEmpresa, nome, email, telefone, senha, nivelAcesso)
        VALUES ('${codigoEmpresa}', '${nome}', '${email}', '${telefone}', '${senha}', '${nivelAcesso}');
    `;
    return database.executar(sql);
}


function listar() {
    const sql = "SELECT * FROM empresa;";
    return database.executar(sql);
}


module.exports = {
    autenticar,
    cadastrar,
    listar
};