#language: pt

    Funcionalidade: Login
        Sendo um usuário cadastrado
        Quero acessar o sistema RockLov
        Para que eu possa anunciar meus equipamentos musicais

    @login
    Cenário: Login do usuário

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "pedrohcastamancarniel@gmail.com" e "pwd123"
        Então sou redirecionado para o Dashboard

    @tentativa_login
    Esquema do Cenário: Tentativas de Logins
        Dado que acesso a página principal
        Quando submeto minhas credenciais com "<email_input>" e "<senha_input>"
        Então vejo a mensagem de alerta: "<mensagem_output>"

        # Matriz de cenários de testes
        Exemplos:
        |email_input                    |senha_input|mensagem_output                 |
        |pedrohcastamancarniel@gmail.com|abc123     |Usuário e/ou senha inválidos.   |
        |pedroh404@gmail.com            |pwd123     |Usuário e/ou senha inválidos.   |
        |pedro$aol.com.uk               |abc123     |Oops. Informe um email válido!  |
        |                               |abc123     |Oops. Informe um email válido!  |
        |pedrohcastamancarniel@gmail.com|           |Oops. Informe sua senha secreta!|