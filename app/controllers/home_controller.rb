class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def home

  end

  # => # => # => #
  # => Registro
  # => # => # => #

  def register

  end

  def validate_register
  	Usuario.find_or_create_by(nombre: params[:name].to_s, usuario: params[:user], contrasena: params[:pass], mail: params[:mail])
    redirect_to root_path and return
  end

  # => # => # => #
  # => Login
  # => # => # => #

  def login

  end

  def validate_login
    user = Usuario.find_by(usuario: params[:user], contrasena: params[:pass])
    if user.tipo == 0 or user.tipo == 1
  	  redirect_to experto_path and return
    else
      redirect_to estudiante_path and return
    end
  end

end
