class CuestionarioController < ApplicationController
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
    @cuestionario = Pregunta.all
  end
end
