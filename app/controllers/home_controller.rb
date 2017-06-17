class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def home
    Pregunta.find_or_create_by(phrase: "Cuando aprendo...", ec_answer: "me gusta vivir sensaciones",
      or_answer: "me gusta pensar sobre ideas", ca_answer: "me gusta estar haciendo cosas",
      ea_answer: "me gusta observar y escuchar")
    Pregunta.find_or_create_by(phrase: "Aprendo mejor cuando...", ec_answer: "escucho y observo cuidadosamente",
      or_answer: "confío en el pensamiento lógico", ca_answer: "confío en mi intuición y sentimientos",
      ea_answer: "trabajo duro para lograr hacer las cosas")
    Pregunta.find_or_create_by(phrase: "Cuando estoy aprendiendo...", ec_answer: "tiendo a usar el razonamiento",
      or_answer: "soy responsable con lo que hago", ca_answer: "soy callado y reservado",
      ea_answer: "tengo fuertes sensaciones y reacciones")
    Pregunta.find_or_create_by(phrase: "Yo aprendo...", ec_answer: "sintiendo", or_answer: "haciendo",
      ca_answer: "observando", ea_answer: "pensando")
    Pregunta.find_or_create_by(phrase: "Cuando aprendo...", ec_answer: "estoy abierto a nuevas experiencias",
      or_answer: "observo todos los aspectos del asunto", ca_answer: "me gusta analizar las cosas",
      ea_answer: "me gusta probar e intentar hacer las cosas")
    Pregunta.find_or_create_by(phrase: "Cuando estoy aprendiendo...", ec_answer: "soy una persona observadora",
      or_answer: "soy una persona activa", ca_answer: "soy una persona intuitiva",
      ea_answer: "soy una persona lógica")
    Pregunta.find_or_create_by(phrase: "Yo aprendo mejor de...", ec_answer: "la observación",
      or_answer: "la relación con otras personas", ca_answer: "las teorías racionales",
      ea_answer: "la oportunidad de probar y practicar")
    Pregunta.find_or_create_by(phrase: "Cuando aprendo...", ec_answer: "me gusta ver los resultados de mi trabajo",
      or_answer: "me gustan las ideas y las teorías", ca_answer: "me tomo mi tiempo antes de actuar",
      ea_answer: "me siento personalmente involucrado en mis cosas")
    Pregunta.find_or_create_by(phrase: "Aprendo mejor cuando...", ec_answer: "confío en mis observaciones",
      or_answer: "confío en mis sentimientos", ca_answer: "puedo probar por mi cuenta",
      ea_answer: "confío en mis ideas")
    Pregunta.find_or_create_by(phrase: "Cuando estoy aprendiendo...", ec_answer: "soy una persona reservada",
      or_answer: "soy una persona receptiva", ca_answer: "soy una persona responsable",
      ea_answer: "soy una persona racional")
    Pregunta.find_or_create_by(phrase: "Cuando aprendo...", ec_answer: "me involucro",
      or_answer: "me gusta observar", ca_answer: "evalúo las cosas", ea_answer: "me gusta ser activo")
    Pregunta.find_or_create_by(phrase: "Aprendo mejor cuando...", ec_answer: "analizo ideas",
      or_answer: "soy receptivo y abierto", ca_answer: "soy cuidadoso", ea_answer: "soy práctico")
  end

  # => # => # => #
  # => Registro
  # => # => # => #

  def register
  end

  def validate_register
    user = Usuario.find_by(usuario: params[:user])
    mail = Usuario.find_by(mail: params[:mail])

    if user.present?
      render html: ("<script>alert('¡El usuario que desea crear ya existe!'); window.location.href = '"+registro_path+"'</script>").html_safe
    elsif mail.present?
      render html: ("<script>alert('¡El correo que desea utilizar ya se encuentra en uso!'); window.location.href = '"+registro_path+"'</script>").html_safe
    elsif params[:pass] != params[:check_pass]
      render html: ("<script>alert('¡Las contraseñas ingresadas no coinciden!'); window.location.href = '"+registro_path+"'</script>").html_safe
    else
      Usuario.create!(nombre: params[:name], usuario: params[:user], contrasena: params[:pass], mail: params[:mail], perfil: rand(1..4), birthday: params[:birth])
      u = Usuario.find_by(usuario: params[:user], mail: params[:mail])
      render html: ("<script>window.location.href = '"+cuestionario_path(u.id.to_s)+"'</script>").html_safe
    end
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
