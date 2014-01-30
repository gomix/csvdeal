class Documento < ActiveRecord::Base 
  attr_accessible :csv_file
  attr_accessible :ordenando
  attr_accessible :ordenando_uuid
  attr_accessible :remitente, :direccion_del_remitente, :tipo_de_envio
  # TODO: estoy seguro que la línea abajo se puede escribir mejor
  has_attached_file :csv_file ,:styles => { :cantv => { :quality => :better } }, :processors => ['cantv']
  validates_presence_of :tipo_de_envio
  validates_presence_of :remitente
  validates_presence_of :direccion_del_remitente

  after_initialize :init

  def init
    self.tipo_de_envio ||= "Documento"     #will set the default value only if it's nil
    self.remitente ||= "Ipostel"     #will set the default value only if it's nil
    self.direccion_del_remitente ||= "San Martín, Caracas, DC."     #will set the default value only if it's nil
  end

  def componer
    # Mandar a componer el filtrado en el documento final
    params = {}
    params["campo"]="nombre"
    params["ascendente"]="ascendente"
    params["id"]=self.id.to_s
    Resque.enqueue(ComponiendoWorker, params)   
  end
end


