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

    Usuario.find_or_create_by(nombre: "", usuario: "", contrasena: "", mail: "")
    
    user = Usuario.find_by(usuario: params[:user])
    mail = Usuario.find_by(mail: params[:mail])

    if user.present?
      render html: ("<script>alert('¡El usuario que desea crear ya existe!'); window.location.href = '"+registro_path+"'</script>").html_safe
    elsif mail.present?
      render html: ("<script>alert('¡El correo que desea utilizar ya se encuentra en uso!'); window.location.href = '"+registro_path+"'</script>").html_safe
    elsif params[:pass] != params[:check_pass]
      render html: ("<script>alert('¡Las contraseñas ingresadas no coinciden!'); window.location.href = '"+registro_path+"'</script>").html_safe
    else
      Usuario.create!(nombre: params[:nombre], usuario: params[:user], contrasena: params[:pass], mail: params[:mail], perfil: rand(1..4))
      u = Usuario.find_by(nombre: params[:nombre], usuario: params[:user], contrasena: params[:pass], mail: params[:mail])
      render html: ("<script>window.location.href = '"+cuestionario_path(u.id.to_s)+"'</script>").html_safe
    end
  end

  # => # => # => #
  # => Encuesta
  # => # => # => #

  def test
  end

  def validate_test
  end

  # => # => # => #
  # => Login
  # => # => # => #

  def login
  end

  def validate_login
    user = Usuario.find_by(usuario: params[:user], contrasena: params[:pass])
    if user.present? and user.tipo == 1           # => Experto?
  	  redirect_to experto_path and return
    elsif user.present? and user.tipo == 2        # => Estudiante?
      if user.perfil == 0
        redirect_to cuestionario_path and return
      else 
        redirect_to estudiante_path and return
      end
    elsif user.present? and user.tipo == 0        # => Admin?
      redirect_to admin_path and return
    else
      render html: ("<script>alert('¡Los datos brindados son incorrectos!'); window.location.href = '"+login_path+"'</script>").html_safe
    end
  end

  def no_student
    if params[:tipo].to_i != 100
      @archivos = Contenido.where(:validado? => true).where(:tipo => params[:tipo].to_i)
    else
      @archivos = Contenido.where(:validado? => true)
    end
    @search = params[:q].split(" ")
  end

end
