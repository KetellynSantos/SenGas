function enviar() {

    if (nome.value === "" || email.value === "" || texto.value === "") {
        alert("Por favor, preencha os campos obrigatórios (*).");
    } else {
        alert("Formulário enviado com sucesso!");
        nome.value = "";
        email.value = "";
        texto.value = "";
    }
}
