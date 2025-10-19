function entrar() {
    var email = iptEmail.value
    var senha =iptSenha.value

    if (email == "teste@teste.com" && senha == "1234") {
        window.location.href = 'dashboard.html';
      } 
      else {
        alert('Email ou senha incorretos');
      }
    }
