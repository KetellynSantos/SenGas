var express = require("express");

var router = express.Router();

var dashControllers = require("../controllers/dashControllers");


router.get("/kpis/:idEmpresa", function (req, res) {
    dashControllers.MedidasKpi(req, res);
});

router.get("/grafico/:idEmpresa", function (req, res) {
    dashControllers.MedidasGrafico(req, res);
});

router.get("/limite/:idEmpresa", function(req, res) {
    dashControllers.obterLimite(req, res);
});

router.get("/dados/:idEmpresa/:setor", function (req, res) {
    dashController.buscarPorSetor(req, res);
});

module.exports = router;