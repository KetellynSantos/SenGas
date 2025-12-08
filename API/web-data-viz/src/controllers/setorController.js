var setorModel = require("../models/setorModel");

function buscarPorSetor(req, res) {
    const idEmpresa = req.params.idEmpresa;
    const setor = req.params.setor;

    setorModel.buscarSetor(idEmpresa, setor)
        .then((resultado) => {
            res.status(200).json(resultado);
        })
        .catch((erro) => {
            res.status(500).json(erro);
        });
}

module.exports = {
    buscarPorSetor
};