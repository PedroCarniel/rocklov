#language: pt

Funcionalidade: Cadastro de Anúncios
        Sendo usuário cadastrado no Rocklov que possui equipamentos musicais
        Quero cadastrar meus equipamentos
        Para que eu possa disponibilizalos para locação

    Contexto: Login 
        * Login com "pedrohcastamancarniel@gmail.com" e "pwd123"

    @cadastro_equipamento
    Cenário: Novo equipamento

        Dado que acesso o formulário de cadastro de anúncios
            E que eu tenho o seguinte equipamento:
                | thumb      | fender-sb.jpg |
                | nome       | Fender Strato |
                | categoria  | Cordas        |
                | preco      | 200           |
            Quando submeto o cadastro desse item
            Então devo ver esse item no meu Dashboard

    @temp
    Esquema do Cenário: Tentantiva do cadastro de anúncios

        Dado que acesso o formulário de cadastro de anúncios
            E que eu tenho o seguinte equipamento:
                | thumb      | <foto>       |
                | nome       | <nome>       |
                | categoria  | <categoria>  |
                | preco      | <preco>      |
            Quando submeto o cadastro desse item
            Então deve conter a mensagem de alerta: "<saida>"

            Exemplos:
                |    foto       |      nome         | categoria | preco | saida                             |
                |               | Violão de Nylon   | Cordas    | 150   | Adicione uma foto no seu anúncio! |
                | clarinete.jpg |                   | Outros    | 250   | Informe a descrição do anúncio!   |
                | mic.jpg       | Microfone Shure   |           | 100   | Informe a categoria               |
                | trompete.jpg  | Trompete Clássico | Outros    |       | Informe o valor da diária         |