# features/support/hooks.rb
require 'mongo'

MongoClient = Mongo::Client.new(['127.0.0.1:27017'], database: 'rocklov')

at_exit do
  # Loga no banco
  client = MongoClient

  # Dropa o banco de dados
  client.database.drop

  # Fecha a conexão
  client.close
end
