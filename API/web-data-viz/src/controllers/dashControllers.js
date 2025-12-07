var dashModel = require("../models/dashModel");

function MedidasKpi(req, res) {
    var idEmpresa = req.params.idEmpresa;

    dashModel.MedidasKpi(idEmpresa)
        .then(resultado => {
            if (resultado.length > 0) res.json(resultado[0]);
            else res.status(204).send("Nenhum resultado encontrado");
        })
        .catch(erro => {
            res.status(500).json(erro.sqlMessage);
        });
}

function MedidasGrafico(req, res) {
    var idEmpresa = req.params.idEmpresa;

    dashModel.MedidasGrafico(idEmpresa)
        .then(resultado => {
            if (resultado.length > 0) res.json(resultado);
            else res.status(204).send("Nenhum resultado encontrado");
        })
        .catch(erro => {
            res.status(500).json(erro.sqlMessage);
        });
}

function obterLimite(req, res) {
    const idEmpresa = req.params.idEmpresa;

    dashModel.buscarLimite(idEmpresa)
        .then(resultado => {
            if (resultado.length > 0) {
                res.json(resultado[0]); // retorna { limite: X }
            } else {
                res.status(404).send("Nenhum limite encontrado.");
            }
        })
        .catch(erro => {
            console.log("Erro ao buscar limite:", erro);
            res.status(500).json(erro);
        });
}

module.exports = {
    MedidasKpi,
    MedidasGrafico,
    obterLimite
};
