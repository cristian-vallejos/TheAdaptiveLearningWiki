class ExpertController < ApplicationController
  skip_before_action :verify_authenticity_token

  def home
  end

  def create
    urls = scrap_webs(params[:text])
    @lista = []
    urls.each do |url|
      @lista << url
    end

    @urls = []
    @titles = []

    pat = /\/url\?q=([^;]*)&/
    @lista.each do |url|
      url = pat.match(url.to_s.encode!('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: ''))[0]
      url.sub! '/url?q=', ''
      url = url.split("&")
      @urls << url[0]
    end

    pat = />([^;]*)<\/a>/
    @lista.each do |title|
      title = pat.match(title.to_s.encode!('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: ''))[0]
      title.sub! '>', ''
      title.gsub! '<b>', ''
      title.gsub! '</b>', ''
      title.gsub! '</a>', ''
      @titles << title
    end

    (0..(urls.length-1)).each do |n|
      Contenido.find_or_create_by(nombre: @titles[n], referencia: @urls[n], tags: params[:text].split(" "))
    end

    redirect_to experto_validar_contenido_path
  end

  def edit
    @archivos = Contenido.where(:validado? => false)
  end

  def update
  end

  def show
  end

  def aprobar
    doc = Contenido.find(params[:id])
    doc.update({validado?: true})

    redirect_to experto_validar_contenido_path
  end

  def denegar
    doc = Contenido.find(params[:id])
    doc.delete

    redirect_to experto_validar_contenido_path
  end

  private
    def scrap_webs(palabras)
      aux = ''
      palabras = palabras.split(" ")
      for palabra in palabras
        aux += palabra+" "
      end
      doc = Nokogiri::HTML(open("https://www.google.ca/search?as_q="+aux+"&as_epq=&as_oq=&as_eq=&as_nlo=&as_nhi=&lr=&cr=&as_qdr=all&as_sitesearch=&as_occt=any&safe=images&as_filetype=pdf&as_rights="))
      entries = doc.css('.r>a')
      #entries[0]['href'] Asi se sacan las URLS
      return entries
    end
end
