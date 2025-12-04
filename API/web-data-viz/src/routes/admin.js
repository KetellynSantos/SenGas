var express = require("express");
var router = express.Router();

var adminController = require("../controllers/adminController");

router.get("/listar", adminController.listar);
router.delete("/deletar/:id", adminController.deletar);


module.exports = router;