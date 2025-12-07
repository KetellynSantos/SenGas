const historicoModel = require("../models/historicoModel");

function listar(req, res){

    var idEmpresa = req.params.idEmpresa;

    historicoModel.listar(idEmpresa)
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