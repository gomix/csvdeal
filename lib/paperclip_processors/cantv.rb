require 'csv'
class Cantv < Paperclip::Processor
  def initialize(file, options = {}, attachment = nil)
    super
    #@file = file
    @current_format = File.extname(@file.path)
    @basename = File.basename(@file.path, @current_format)
  end

  # Performs the conversion of the +cantv_csv_file+ into a +csv_printable_file. 
  # Returns the Tempfile that contains the new csv file.
    def make
      #src = @file
      dst = Tempfile.new(@basename, :encoding => 'utf8')
      File.open(File.expand_path(dst.path),"w+") do |f|
        CSV.foreach(@file.path) do |row|
          f.write(filtrar(row)) if row
          Rails.logger.debug "row: #{row}"
          Rails.logger.debug "filtrar(row): #{filtrar(row)}"
        end
      end
      dst
    end

    def filtrar(row)
      # Recibe una línea y la devuelve filtrada
      # Los primeros dos campos los dejo tranquilos
      # El último lo separo en tres por "_" como separador
      # Devuelve nil si no hay nada en el tercer campo
      # El formato de origen son 3 campos
      r = case row.size
        when 3 then (row.slice(0..1) + row[2].split("_",3)).to_csv
        when 2 then row.to_csv
        when 1 then row.to_csv
      end
      r
    end
end
