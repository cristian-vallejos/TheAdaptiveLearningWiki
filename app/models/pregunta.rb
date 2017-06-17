class Pregunta
  # == MongoDB
  include Mongoid::Document

  # == Atributos
  field :phrase,          	    type: String
  field :ec_answer,             type: String
  field :or_answer,             type: String
  field :ca_answer,             type: String
  field :ea_answer,             type: String

  # == Asociaciones
  has_many :topicos,	class_name: "Topico"
end
