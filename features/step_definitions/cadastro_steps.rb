Dado("que acesso a página de cadastro") do
  @signup_page.open
end

Quando("submeto o seguinte formulário de cadastro:") do |table|
  # Pegar os dados da tabela da história, converter eles em array e pegar o primeiro item
  log table.hashes
  user = table.hashes.first
  log user

  @signup_page.create(user)
end
