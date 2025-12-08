var express = require("express");
var router = express.Router();

var setorController = require("../controllers/setorController");

router.get("/dados/:idEmpresa/:setor?", function (req, res) {
    setorController.buscarPorSetor(req, res);
});

module.exports = router;
var setorModel = require("../models/setorModel");

function buscarPorSetor(req, res) {
    const idEmpresa = Number(req.params.idEmpresa);
    const setorParam = req.params.setor|| req.query.setor|| null;

    if (Number.isNaN(idEmpresa)) {
        return res.status(400).send("idEmpresa inválido");
    }

    setorModel.buscarSetor(idEmpresa, setorParam)
        .then((resultado) => {
            res.status(200).json(resultado);
        })
        .catch((erro) => {
            console.error("Erro ao buscar dados dos setores:", erro);
            res.status(500).json(erro);
        });
}

module.exports = {
    buscarPorSetor
};
