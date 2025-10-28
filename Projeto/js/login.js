let tentativas = 3;
function entrar() {
  let email = iptEmail.value;
  let pass = iptSenha.value;

  while (tentativas > 0) {
    if (email == "vinicius@sengas.com.br" && pass == "q1Q!q1Q!") {
      window.location.href = 'dashboard.html';
      break;
    } else if (email == "davi@sengas.com.br" && pass == "123@Davi") {
      window.location.href = 'dashboard.html';
      break;
    } else if (email == "gabriela@sengas.com.br" && pass == "123@Gabi") {
      window.location.href = 'dashboard.html';
      break;
    } else if (email == "manuela@sengas.com.br" && pass == "123@Manu") {
      window.location.href = 'dashboard.html';
      break;
    } else if (email == "ketellyn@sengas.com.br" && pass == "123@Ketellyn") {
      window.location.href = 'dashboard.html';
      break;
    } else if (email == "breno@sengas.com.br" && pass == "123@Breno") {
      window.location.href = 'dashboard.html';
      break;
    } else if (email == "teste@sengas.com.br" && pass == "123@Teste") {
      window.location.href = 'dashboard.html';
      break;
    } else if (email == "teste@teste.com" && pass == "1234") {
      window.location.href = 'dashboard.html';
      break;
    } else {
      tentativas--;
      console.log(tentativas);
      if (tentativas > 0) {
        alert(`Login ou senha Invalidas`);
      } else {
        alert(`Conta bloqueada!\nTente novamente mais tarde.`);
      }
      return;
    }
  }
}