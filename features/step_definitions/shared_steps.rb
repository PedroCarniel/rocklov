# Documentar os steps compartilhados entre as telas

# Utilizado no cadastro e no login
Então("sou redirecionado para o Dashboard") do
  expect(@dash_page.on_dash?).to be true
end

# Tentativas de cadastro/login com falha vão passar por aqui sendo elas: nome, email, senha
Então("vejo a mensagem de alerta: {string}") do |expect_alert|
  expect(@alert.dark).to eql expect_alert
end
