class Usuario
  # == MongoDB
  include Mongoid::Document

  # == Constantes
  YES           = 1
  NO            = 0

  ROLE_ADMIN    = 0
  ROLE_EXPERT   = 1
  ROLE_STUDENT  = 2

  DIVERGING     = 0
  ASSIMILATING  = 1
  CONVERGING    = 2
  ACCOMMODATING = 3

  ## Atributos
  field :nombre,                  type: String
  field :usuario,                 type: String
  field :contrasena,              type: String
  field :mail,                    type: String
  field :tipo,                    type: Integer,  default: ROLE_STUDENT
  field :perfil,                  type: Integer
  field :birthday,                type: Date
  field :test_solved?,            type: Integer,  default: NO

  # == Asociaciones
  #has_many :subscriptions, class_name: "Payments::Subscription"
  #has_many :quotes,         class_name: "Payments::Quote"

  # == Métodos
  def admin?
    (self.role == User::ROLE_ADMIN)
  end

  def expert?
    (self.role == User::ROLE_EXPERT)
  end

  def student?
    (self.role == User::ROLE_STUDENT)
  end
end
