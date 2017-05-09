class Usuario
  # == MongoDB
  include Mongoid::Document
  #include Mongoid::Search
  include Mongoid::Timestamps

  # == Atributos
  field :nombre,          	    type: String
  field :usuario,               type: String
  field :contrasena,            type: String
  field :mail,                  type: String
  field :tipo,                  type: Integer,  default: 2
  field :perfil,                type: Integer,  default: 0

  # == Asociaciones
  #has_many :subscriptions,	class_name: "Payments::Subscription"
  #has_many :quotes,         class_name: "Payments::Quote"
end