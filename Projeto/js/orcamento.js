    function enviar() {
        // Variáveis criadas para validação dos campos
        let erro = '';
        let erro1 = '';
        let erro2 = '';

        if (nome.value == '')
            erro += '* Este campo é obrigatório.';
        if (email.value == '')
            erro1 += '* Este campo é obrigatório.';
        if (texto.value == '')
            erro2 += '* Este campo é obrigatório.';
        if (erro != '' || erro1 != '' || erro2 != '') {
            div_msg.innerHTML = '<b><span style = color:green;>' + erro + '</span></b>';
            div_msg1.innerHTML = '<b><span style = color:green;>' + erro1 + '</span></b>';
            div_msg2.innerHTML = '<b><span style = color:green;>' + erro2 + '</span></b>';
        }
        else {
            alert("Formulário enviado com sucesso!");
            nome.value = "";
            email.value = "";
            texto.value = "";
        }
    }
