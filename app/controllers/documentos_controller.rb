class DocumentosController < ApplicationController
  # GET /documentos
  # GET /documentos.json
 def import
   require 'csv'
   csv_text = File.read(params[:file].tempfile.to_path.to_s)
 end 

 def index
    @documentos = Documento.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @documentos }
    end
  end

  # GET /documentos/1
  # GET /documentos/1.json
  def show
    # Al mostrar, no solo se puede escoger la representación del recurso
    # sino que también se le pueden pasar acciones como parte del query string
    # Ejemplo /documentos/:id?filtro=cantv
    # Indicaría obtener el recurso expresado/filtrado al filtro cantv del recurso
    @documento = Documento.find(params[:id])

    if params[:filtro] 
      @documento.filtrar(params[:filtro])
    #  logger.debug "Documento, filtrar, filtro: #{params[:filtro]}"
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @documento }
    end
  end

  # GET /documentos/new
  # GET /documentos/new.json
  def new
    @documento = Documento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @documento }
    end
  end

  # GET /documentos/1/edit
  def edit
    @documento = Documento.find(params[:id])
  end

  # POST /documentos
  # POST /documentos.json
  def create
    @documento = Documento.new(params[:documento])

    respond_to do |format|
      if @documento.save
        format.html { 
		redirect_to @documento , notice: 'Documento creado con éxito.', flash: {estado: 0}
        }
        format.json { render json: @documento, status: :created, location: @documento }
      else
        format.html { render action: "new" }
        format.json { render json: @documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /documentos/1
  # PUT /documentos/1.json
  def update
    @documento = Documento.find(params[:id])

    respond_to do |format|
      if @documento.update_attributes(params[:documento])
        format.html { redirect_to @documento, notice: 'Documento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documentos/1
  # DELETE /documentos/1.json
  def destroy
    @documento = Documento.find(params[:id])
    @documento.destroy

    respond_to do |format|
      format.html { redirect_to documentos_url }
      format.json { head :no_content }
    end
  end

end
