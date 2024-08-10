#language: pt

Funcionalidade: Cadastro

     Sendo um músico que possui equipamentos musicais
     Quero fazer o meu cadastro no RockLov
     Para que eu possa disponibilizá-los para locação

     @cadastro
     Cenário: Criar um cadastro

          Dado que acesso a página de cadastro
          Quando submeto o seguinte formulário de cadastro:
               |nome          |email                          |senha |
               |Pedro Henrique|pedrohcastamancarniel@gmail.com|pwd123|
          Então sou redirecionado para o Dashboard

     @tentativa_cadastro
     Esquema do Cenário: Tentativas de Cadastros
     
          Dado que acesso a página de cadastro
          Quando submeto o seguinte formulário de cadastro:
               |nome          |email        |senha        |
               |<nome_input>  |<email_input>|<senha_input>|
          Então vejo a mensagem de alerta: "<mensagem_output>"

          # Matriz de cenários de testes
          Exemplos: 
               |nome_input    |email_input                    |senha_input|mensagem_output                 |
               |              |pedrohcastamancarniel@gmail.com|pwd123     |Oops. Informe seu nome completo!|
               |Pedro Henrique|                               |pwd123     |Oops. Informe um email válido!  |
               |Pedro Henrique|pedrohcastamancarniel*gmail.com|pwd123     |Oops. Informe um email válido!  |
               |Pedro Henrique|pedrhocastamancarniel$gmail.com|pwd123     |Oops. Informe um email válido!  |
               |Pedro Henrique|pedrohcastamancarniel@gmail.com|           |Oops. Informe sua senha secreta!|
