class Contenido
  # == MongoDB
  include Mongoid::Document
  #include Mongoid::Search
  include Mongoid::Timestamps

  # == Atributos
  field :nombre,          	    type: String
  field :tipo,                  type: Integer,  default: 0
  field :referencia,            type: String
  field :calificacion,	  	    type: Float,   default: 0
  field :numero_calificaciones, type: Integer,  default: 0
  field :validado?,             type: Boolean,  default: false
  field :tags,                  type: Array

  # == Asociaciones
  #has_many :subscriptions,	class_name: "Payments::Subscription"
  #has_many :quotes,         class_name: "Payments::Quote"
end