function entrar() {
    var email = iptEmail.value
    var senha =iptSenha.value

    if (email == "teste@teste.com" && senha == "1234") {
        window.location.href = 'home.html';
      } 
      else {
        alert('Email ou senha incorretos. Tente: teste@teste.com / 1234');
      }
    }
