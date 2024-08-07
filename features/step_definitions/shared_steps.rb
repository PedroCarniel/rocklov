# Documentar os steps compartilhados entre as telas

# Utilizado no cadastro e no login
Então('sou redirecionado para o Dashboard') do
  expect(page).to have_css ".dashboard"
end

# Tentativas de cadastro/login com falha vão passar por aqui sendo elas: nome, email, senha
Então('vejo a mensagem de alerta: {string}') do |expect_alert|
  alert = find(".alert-dark")
  expect(alert.text).to eql expect_alert
end
