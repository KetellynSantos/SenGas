function simular() {
       var ProdDia = Number(iptProdDia.value);
       var PrecoVenda = Number(iptPrecoVenda.value);

       var ProdAno = ProdDia * 365; // Produção de gas anual
       var PrecoAno = ProdAno * PrecoVenda; // Quanto ganha por ano 

       var perdaFinanceira = PrecoAno * 0.03; // Perda no armazenamento (em dinheiro)
       var lucro = PrecoAno * 0.05; // Em toda a produção com a solução (em dinheiro)
       var multa = ProdAno * 0.05; // valor da multa
       var economiaComSenGas = perdaFinanceira + multa // economia total se o SenGás for usado

       let erro = '';  // Variável criada para validação dos campos
       let erro1 = ''; // Variável criada para validação dos campos

       // Validações dos campos
       if (ProdDia == 0){
              erro += '* Este campo é obrigatório.';}
       if (PrecoVenda == 0){
              erro1 += '* Este campo é obrigatório.';}
       if (ProdDia < 0){
              erro += '* Este campo só pode ser preenchido com valores positivos acima de zero.';}
       if (PrecoVenda < 0){
              erro1 += '* Este campo só pode ser preenchido com valores positivos acima de zero.'}
       if (erro != '' || erro1 != '') {
              div_msg.innerHTML =  `${erro}`;
              div_msg1.innerHTML = `${erro1}`;
       }
       else {
              resultado.innerHTML = `
              <b>Receita anual:</b> ${PrecoAno.toLocaleString('pt-br', { style: "currency", currency: 'BRL' })}<br>
              <i>(valor produzido por dia * dias no ano * preço de venda)</i><br><br>

              <b>Perdas estimadas em 3%:</b> ${perdaFinanceira.toLocaleString('pt-br', { style: "currency", currency: 'BRL' })}<br>
              <i>Por que 3%? Estima-se que empresas sem controle eficiente percam cerca de 3% da receita devido a vazamentos e desperdício de gás.<br></i><br>

              <b>Multa ambiental de 5%:</b> ${multa.toLocaleString('pt-br', { style: "currency", currency: 'BRL' })}<br>
              <i>Por que 5%? Baseado em penalidades do Sistema Brasileiro de Comércio de Emissões de Gases de Efeito Estufa (SBCE) por emissões não controladas de metano.<br></i><br>

              <b> Economia com SenGás: </b> ${economiaComSenGas.toLocaleString('pt-br', { style: "currency", currency: 'BRL' })}<br>
              <i> Valor que sua empresa deixaria de perder ao adotar o sistema SenGás.</i><br><br>
              <div class="lucro">
               <b>Lucro com SenGás: ${lucro.toLocaleString('pt-br', { style: "currency", currency: 'BRL' })}</b><br>
               <i> Com o sistema SenGás, sua operação reduz perdas, evita multas, otimiza processo de compressão e armazenamento e ainda pode aumenta a eficiência da produção em 5%.</i>
              <div/>
               <br>   <div class="simular-orc">
                <button onclick=""> Solicitar Orçamento!</button>
            </div>`
              }
} 