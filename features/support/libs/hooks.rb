# features/support/hooks.rb
require 'mongo'

MongoClient = Mongo::Client.new(['127.0.0.1:27017'], database: 'rocklov')

at_exit do
  # Conecte-se ao cliente MongoDB
  client = MongoClient

  # Drope o banco de dados
  client.database.drop

  # Feche a conexão
  client.close
end
