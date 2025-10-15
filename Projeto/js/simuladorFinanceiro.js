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
       if (ProdDia == 0)
              erro += '* Este campo é obrigatório.';
       if (PrecoVenda == 0)
              erro1 += '* Este campo é obrigatório.';
       if (ProdDia < 0)
              erro += '* Este campo só pode ser preenchido com valores positivos acima de zero.';
       if (PrecoVenda < 0)
              erro1 += '* Este campo só pode ser preenchido com valores positivos acima de zero.';
       if (erro != '' || erro1 != '') {
              div_msg.innerHTML = '<b><span style = color:green;>' + erro + '</span></b>';
              div_msg1.innerHTML = "<b><span style = color:green;>" + erro1 + "</span></b>";
       }
       else {
              resultado.innerHTML = ` <b> Resultado da Simulação </b><br><br>
              <b>Receita anual:</b> ${PrecoAno.toLocaleString('pt-br', { style: "currency", currency: 'BRL' })}<br><br>

              <b>Perdas estimadas em 3%:</b> ${perdaFinanceira.toLocaleString('pt-br', { style: "currency", currency: 'BRL' })}<br>
              <i><b>Por que 3%?</b> Estima-se que empresas sem controle eficiente percam cerca de <b>3% da receita</b> 
              devido a vazamentos e desperdício de gás.<br><br></i><br>

              <b>Multa ambiental de 5%:</b> ${multa.toLocaleString('pt-br', { style: "currency", currency: 'BRL' })}<br>
              <i><b>Por que 5%?</b> Baseado em penalidades do <b>Sistema Brasileiro de Comércio de Emissões de Gases de Efeito Estufa (SBCE)</b> por emissões não controladas de metano.<br><br></i><br>

              <b> Economia com SenGás: </b> ${economiaComSenGas.toLocaleString('pt-br', { style: "currency", currency: 'BRL' })}<br>
              <i> Valor que sua empresa deixaria de perder ao adotar o sistema SenGás.</i><br><br>

               <b>Lucro com SenGás:</b> ${lucro.toLocaleString('pt-br', { style: "currency", currency: 'BRL' })}<br>
               <i> Com o sistema SenGás, sua operação reduz perdas, evita multas, otimiza processo de compressão e armazenamento e ainda pode aumenta a eficiência da produção em <b>5%</b>.</i>`

              }
} 