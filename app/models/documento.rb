class Documento < ActiveRecord::Base 
attr_accessible :csv_file
  # TODO: estoy seguro que la línea abajo se puede escribir mejor
  has_attached_file :csv_file ,:styles => { :cantv => { :quality => :better } }, :processors => ['cantv']
end

class OrderingWorker
  @queue = :ordering
  def self.perform(str)
    (1..30000000000000000000000000000000000000000000000000000000000000000000000000000).each do |i|
    puts "From ordering worker: " + str
  end
end
end 

