class Documento < ActiveRecord::Base 
  attr_accessible :csv_file
  attr_accessible :ordenando
  attr_accessible :ordenando_uuid
  # TODO: estoy seguro que la línea abajo se puede escribir mejor
  has_attached_file :csv_file ,:styles => { :cantv => { :quality => :better } }, :processors => ['cantv']
end


