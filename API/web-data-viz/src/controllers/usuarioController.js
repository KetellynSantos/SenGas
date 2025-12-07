const usuarioModel = require("../models/usuarioModel");

function autenticar(req, res) {
    var email = req.body.email;
    var senha = req.body.senha;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {

        usuarioModel.autenticar(email, senha)
            .then(function (resultadoAutenticar) {
                console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
                console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`);

                if (resultadoAutenticar.length == 1) {
                    res.json({
                        id: resultadoAutenticar[0].id,
                        nome: resultadoAutenticar[0].nome,
                        email: resultadoAutenticar[0].email,
                        nivelAcesso: resultadoAutenticar[0].nivelAcesso,
                        idEmpresa: resultadoAutenticar[0].idEmpresa,  
                        codigoEmpresa: resultadoAutenticar[0].codigoEmpresa
                    });

                } else if (resultadoAutenticar.length == 0) {
                    res.status(403).send("Email e/ou senha inválido(s)");
                } else {
                    res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                }
            })
            .catch(function (erro) {
                console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            });
    }
}

function cadastrar(req, res) {
    var nome = req.body.nome;
    var telefone = req.body.telefone;
    var email = req.body.email;
    var senha = req.body.senha;
    var nivelAcesso = req.body.nivelAcesso;
    var codigoEmpresa = req.body.codigoEmpresa;

    if (nome == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else if (telefone == undefined) {
        res.status(400).send("Seu telefone está undefined!");
    } else if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está undefined!");
    } else if (nivelAcesso == undefined) {
        res.status(400).send("O nível de acesso está undefined!");
    } else if (codigoEmpresa == undefined) {
        res.status(400).send("A empresa vinculada está undefined!");
    } else {

        usuarioModel.cadastrar(codigoEmpresa, nome, telefone, email, senha, nivelAcesso)
            .then(function (resultado) {
                res.json(resultado);
            })
            .catch(function (erro) {
                console.log("\nErro ao cadastrar:", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            });
    }
}

function listar(req, res) {
    usuarioModel.listar()
        .then(resultado => {
            res.status(201).json({
                mensagem: "Usuário cadastrado com sucesso!",
                idInserido: resultado.insertId
            });
        })
        .catch(erro => {
            console.log("Erro ao listar empresas:", erro);
            res.status(500).json(erro);
        });
}


module.exports = {
    autenticar,
    cadastrar,
    listar
};
