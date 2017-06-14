class Topico
  # == MongoDB
  include Mongoid::Document
  #include Mongoid::Search
  include Mongoid::Timestamps

  # == Atributos
  field :nombre,          	    type: String
  field :id,                    type: String
  field :tipo,                  type: Integer,  default: 0


  # == Asociaciones
  has_many :contenidos,	class_name: "Contenido"
end
