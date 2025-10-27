// Filtro de busca funcional
document.getElementById('search').addEventListener('keyup', function () {
    const termo = this.value.toLowerCase();
    document.querySelectorAll('#userTable tbody tr').forEach(tr => {
        const nome = tr.cells[1].textContent.toLowerCase();
        const sobrenome = tr.cells[2].textContent.toLowerCase();
        tr.style.display = (nome.includes(termo) || sobrenome.includes(termo)) ? '' : 'none';
    });
});

// Botão "Cadastrar usuário" (sem ação por enquanto)
document.getElementById('addUser').addEventListener('click', () => {
    alert('Função de cadastro em desenvolvimento.');
});

// Botões de editar/excluir (sem ação)
document.querySelectorAll('.edit-btn').forEach(btn => {
    btn.addEventListener('click', () => {
        console.log('Botão editar clicado.');
    });
});

document.querySelectorAll('.delete-btn').forEach(btn => {
    btn.addEventListener('click', () => {
        console.log('Botão excluir clicado.');
    });
});