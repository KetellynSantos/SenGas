var adminModel = require("../models/adminModel");

function listar(req, res) {
    adminModel.listar()
        .then(resultado => res.json(resultado))
        .catch(erro => {
            console.log("Erro ao listar usuários:", erro);
            res.status(500).json(erro);
        });
}

function deletar(req, res) {
    const id = req.params.id;

    adminModel.deletar(id)
        .then(resultado => res.json(resultado))
        .catch(erro => {
            console.log("Erro ao deletar usuário:", erro);
            res.status(500).json(erro);
        });
}

module.exports = {
    listar,
    deletar
};
