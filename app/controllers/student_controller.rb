class StudentController < ApplicationController
  skip_before_action :verify_authenticity_token

  def home
    @archivos = Contenido.where(:validado? => true, :calificacion => {:$gt => 2.0})
  end

  def show
    if params[:tipo].to_i != 100
      @archivos = Contenido.where(:validado? => true, :tipo => params[:tipo].to_i)
    else
      @archivos = Contenido.where(:validado? => true)
    end
    @search = params[:q].split(" ")
  end

  def search
  end

  def calificar
    obj = Contenido.find(params[:id])
    obj.update({calificacion: ((obj.calificacion*obj.numero_calificaciones+params[:star].to_i)/(obj.numero_calificaciones+1)).to_f})
    obj.update({numero_calificaciones: obj.numero_calificaciones+1})
    redirect_to results_path+"?q="+params[:search]+"&tipo="+params[:type] and return
  end

end
