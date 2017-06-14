class Usuario
  # == MongoDB
  include Mongoid::Document

  # == Constantes
  GENDER_MALE   = 1
  GENDER_FEMALE = 2

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
  field :perfil,                  type: Integer,  default: DIVERGING
  field :gender,                  type: Integer
  field :birthday,                type: Date

  # == Asociaciones
  #has_many :subscriptions, class_name: "Payments::Subscription"
  #has_many :quotes,         class_name: "Payments::Quote"

  # == Métodos
  def male?
    (self.gender == User::GENDER_MALE)
  end

  def female?
    (self.gender == User::GENDER_FEMALE)
  end

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
