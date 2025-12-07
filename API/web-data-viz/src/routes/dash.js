var express = require("express");

var router = express.Router();

var dashControllers = require("../controllers/dashControllers");


router.get("/kpis/:idUsuario", function (req, res) {
    dashControllers.MedidasKpi(req, res);
});

router.get("/graficos/:idUsuario", function (req, res) {
    dashControllers.MedidasGrafico(req, res);
});

module.exports = router;