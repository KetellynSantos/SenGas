const historicoModel = require("../models/historicoModel");

function listar(req, res){
    historicoModel.listar()
        .then(resultado => {
            res.status(200).json(resultado);
        })
        .catch(erro =>{
            console.log("Erro ao buscar informações de historico!", erro);
            res.status(500).json(erro);
        })
}

module.exports = {
    listar
};