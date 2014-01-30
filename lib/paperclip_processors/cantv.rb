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
    # @queue = :filtro_csv
      #src = @file
      #dst = Tempfile.new(@basename, :encoding => 'utf8')
      dst = Tempfile.new(@basename)
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
      r = case row.size
        when 4 then (row[0].split("_",4) + row[1].split("_",4) + row.slice(2..3)).to_csv
        when 2 then row.to_csv
        when 1 then row.to_csv
      end
      r
    end
end

# Muestra de líneas del CSV fuente
#Cliente ,Direccion ,Region,Peso Gramos
#0000001_101780573328122013_9009079877_PRESIDENCIA DE LA REPUBLICA,AV URDANETA ED PALACIO BLANCO DPTO ADMINISTRACION_Caracas_Dtto Capital_1010,Capital,20
#0000001_101780573328122013_9009079877_PRESIDENCIA DE LA REPUBLICA,AV URDANETA ED PALACIO BLANCO DPTO ADMINISTRACION_Caracas_Dtto Capital_1010,Capital,20
#0000002_101780764028122013_9009079973_CONSEJO NAC. ELECTORAL,EQ PAJARITO ED CONSEJO SUPREMO ELECTORAL PB_Caracas_Dtto Capital_1010,Capital,32
#0000003_101781436228122013_9009090089_MIN PODER POPULAR AGRIC TIER,AV URDANETA ED MAT NA_Caracas_Dtto Capital_1010,Capital,20
#0000005_101781398528122013_9009079958_MERCADO D ALMENTOS CA MERCAL,AV FUERZAS ARMADAS ED TORRE CVA PISO 3 OFC 3_Caracas_Dtto Capital_1011,Capital,24
#0000006_101784509628122013_9009090004_INST.GEOG. DE VZLA. SIMOM B.,AV ESTE 6 ED CAMEJO PSIO 2_Caracas_Dtto Capital_1012,Capital,20
#0000007_101784558728122013_9009090005_SAIME,AV BARALT ED MIL P 5_Caracas_Dtto Capital_1012,Capital,20
#0000008_101781450828122013_9009090014_MIN SALUD Y DESARROLLO SOCIA,EQ PAJARITOS EQ LA PALMA ED CSB  SUR PISO 6 OFIC 6_Caracas_Dtto Capital_1012,Capital,20
