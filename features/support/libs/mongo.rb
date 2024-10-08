# Classe e função que apaga o usuário do banco para refazer os testes sem usar o faker.
require "mongo"

Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDB
  attr_accessor :users, :equipos

  def initialize
    client = Mongo::Client.new("mongodb://rocklov-db/rocklov")
    @users = client[:users]
    @equipos = client[:equipos]
  end

  def get_user(email)
    user = @users.find({ email: email }).first
    return user[:_id]
  end

  def remover_equipamento(name, email)
    user_id = get_user(email)
    @equipos.delete_many({ name: name, user: user_id })
  end
end
