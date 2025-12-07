var express = require("express");
var router = express.Router();

var setorController = require("../controllers/setorController");

router.get("/dados/:idEmpresa/:setor", function (req, res) {
    dashController.buscarPorSetor(req, res);
});

module.exports = router;