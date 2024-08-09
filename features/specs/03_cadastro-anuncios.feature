#language: pt

Funcionalidade: Cadastro de Anúncios
        Sendo usuário cadastrado no Rocklov que possui equipamentos musicais
        Quero cadastrar meus equipamentos
        Para que eu possa disponibilizalos para locação

    @cadastro_equipamento
    Cenário: Novo equipamento

        Dado que estou logado como "pedrohcastamancarniel@gmail.com" e "pwd123"
            E que acesso o formulário de cadastro de anúncios
            E que eu tenho o seguinte equipamento:
                | thumb      | fender-sb.jpg |
                | nome       | Fender Strato |
                | categoria  | Cordas        |
                | preco      | 200           |
            Quando submeto o cadastro desse item
            Então devo ver esse item no meu Dashboard