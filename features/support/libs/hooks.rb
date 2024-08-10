require 'mongo'

# Hook que instancia a variável permitindo utilizar em varios steps sem precisar ficar inicializando ela
Before do
    @alert= Alert.new
    @login_page = LoginPage.new
end

# Drop do banco pros testes não bugarem
MongoClient = Mongo::Client.new(['127.0.0.1:27017'], database: 'rocklov')

at_exit do
  # Loga no banco
  client = MongoClient

  # Dropa o banco de dados
  client.database.drop

  # Fecha a conexão
  client.close
end
