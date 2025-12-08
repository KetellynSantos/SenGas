var express = require("express");
var router = express.Router();

var setorController = require("../controllers/setorController");

router.get("/dados/:idEmpresa/:setor?", function (req, res) {
    setorController.buscarPorSetor(req, res);
});

module.exports = router;