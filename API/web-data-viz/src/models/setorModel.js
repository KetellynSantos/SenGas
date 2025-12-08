var database = require("../database/config");

function buscarSetor(idEmpresa) {
    const sql = `
SELECT valor AS valor, 
 dtRegistro AS data, 
 setor AS setor
  FROM captura 
  JOIN sensor 
  ON fkSensor = idSensor
   WHERE fkEmpresa = ${idEmpresa} 
   AND setor = 'Laboratório Criogênico' 
   ORDER BY dtRegistro;
    `;
    return database.executar(sql);
}

module.exports = {
    buscarSetor
};


