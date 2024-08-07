Dado('que acesso a página de cadastro') do
    visit "/signup"
end

Quando('submeto o seguinte formulário de cadastro:') do |table|
    # Pegar os dados da tabela da história, converter eles em array e pegar o primeiro item
    log table.hashes
    user = table.hashes.first
    log user

    MongoDB.new.remover_usuario(user[:email])

    find("#fullName").set user[:nome]
    find("#email").set user[:email]
    find("#password").set user[:senha]

    click_button "Cadastrar"
  end
