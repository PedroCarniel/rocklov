class LoginPage
  include Capybara::DSL

    def abre_pagina
        visit "/"
    end

    def campo_email
        return find("#user_email")
    end

    def campo_senha
        return find("#user_password")
    end

    def botao_entrar
        click_button "Entrar"
    end

end
