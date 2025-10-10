 function simular() {
        var ax_ProdDia = Number (iptProdDia.value);
        var ax_PrecoVenda = Number (iptPrecoVenda.value);

        var ax_ProdAno = ax_ProdDia * 365; // Produção de gas anual
        var ax_PrecoAno = ax_ProdAno * ax_PrecoVenda; // Quanto ganha por ano 

        var ax_perdaFinanceira = ax_PrecoAno * 0.03; // Perda no armazenamento (em dinheiro)
        var ax_lucro = ax_PrecoAno * 0.05; // Em toda a produção com a solução (em dinheiro)
        var ax_multa = ax_ProdAno * 0.05; // valor da multa


        resultado.innerHTML = '<br>Perda estimada<br><b>R$' + ax_perdaFinanceira.toFixed(2) + '</b><br><br>Com a solução SenGás o lucro seria<br><b>R$' +  ax_lucro.toFixed(2) + '</b><br><i> representando 5% da produção anual</i>' + '<br><br>Caso não exista sistema de monitoramento, você está sujeito a perder <b>R$' + ax_multa.toFixed(2) + '</b>, de acordo com o Sistema Brasileiro de Comércio de Emissões de Gases de Efeito Estufa (SBCE)';     
        
 }
