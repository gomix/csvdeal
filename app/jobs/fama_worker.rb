class FamaWorker
  @queue = :fama
   
  def self.perform(params)
    src = Documento.find(params["id"].to_i)
    dst = Tempfile.new("cantv")

    File.open(File.expand_path(dst.path),"w+") do |f|
      original = CSV.read(src.csv_file.path(:cantv),{headers: false})
      pares = []
      original.each { |csv_row| pares << csv_row }

      # Escritura de encabezados CSV
      h = "Cliente1,Direccion1,Region1,PesoGramos1,Remitente1,DireccionRemitente1,TipoDeEnvio1,CodigoDeBarra1\n"
      f.write(h)

      # Escritura de datos al archivo CSV
      pares.size.times { |i|
        code1 = Code.find_by_tomado(false)
        code1.tomado=true
        code1.save
       
        par =   pares[i].to_csv.chomp + 
                ",#{src.remitente.gsub(",", "")}" + 
                ",#{src.direccion_del_remitente.gsub(",", "")}" + 
                ",#{src.tipo_de_envio}" + 
                ",#{code1.code}" 

        f.write( par + "\n" )
      }
    end
   
    # TODO: Estos mensajes me gustarían que apareciesen en los logs de Rails
    puts "original:#{src.csv_file.path(:cantv)}"
    #puts "original.size:#{original.size}"
    puts "procesado:#{dst.path}"
  end

end
