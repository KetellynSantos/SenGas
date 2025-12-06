console.log("JS carregado!");

function enviar() {

    console.log("Função enviar() foi chamada");

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
        msg.innerHTML = `${erro}`
        msg1.innerHTML = `${erro1}`
        msg2.innerHTML = `${erro2}`
    }
    else {
        alert("Formulário enviado com sucesso!");
        nome.value = "";
        email.value = "";
        texto.value = "";
    }
}
