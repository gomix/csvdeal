class Documento < ActiveRecord::Base
  attr_accessible :csv_file
  has_attached_file :csv_file ,:styles => { :cantv => { :quality => :better } }, :processors => ['cantv']
end
