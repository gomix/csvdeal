require 'csv'
class ComponiendoWorker
  @queue = :componiendo
  
  def self.perform(params)
    src = Documento.find(params["id"].to_i)
    @file = src.csv_file.path(:cantv)
    dst = Tempfile.new("cantv")
    
    puts "@file:#{@file}"
    puts "dst:#{dst.path}"

    code1 = Code.find_by_tomado(false)
    code1.tomado=true
    code1.save
    code2 = Code.find_by_tomado(false)
    code2.tomado=true
    code2.save

    File.open(File.expand_path(dst.path),"w+") do |f|
      #original = CSV.table(@file)
      original = CSV.read(@file,{headers: false})
      pares = []
      impares = []
      index = 0
      original.each { |csv_row|
        index = index + 1
        if index.even?
          impares << csv_row
        else
          pares << csv_row
        end
      }

      h = "SerialCANTV1,rif-fecha1,ControlCANTV1,Cliente1,Direccion1,Ciudad1,Estado1,CodigoPostal1,Region1,PesoGramos1,Remitente1,DireccionRemitente1,TipoDeEnvio1,CodigoDeBarra1,SerialCANTV2,rif-fecha2,ControlCANTV2,Cliente2,Direccion2,Ciudad2,Estado2,CodigoPostal2,Region2,PesoGramos2,Remitente2,DireccionRemitente2,TipoDeEnvio2,CodigoDeBarra2\n"
      f.write(h)

      how_many = original.size/2 + original.size.modulo(2)
      how_many.times { |i|
        code1 = Code.find_by_tomado(false)
        code1.tomado=true
        code1.save
        code2 = Code.find_by_tomado(false)
        code2.tomado=true
        code2.save
        
        f.write(
                pares[i].to_csv.chomp + 
                ",#{src.remitente.gsub(",", "")}" + 
                ",#{src.direccion_del_remitente.gsub(",", "")}" + 
                ",#{src.tipo_de_envio}" + 
                ",#{code1.code}" + 
                "," +  
                impares[i].to_csv.chomp + 
                ",#{src.remitente.gsub(",", "")}" + 
                ",#{src.direccion_del_remitente.gsub(",", "")}" + 
                ",#{src.tipo_de_envio}" + 
                ",#{code2.code}" + 
                "\n" 
        )
      }
    end
  end

  puts "termino"
end


# Paridera para ir generando línea por línea
        # Inserción de datos faltantes (remitente,direccion_remitente,tipode envio,codigo de barra)
        #row = row + [src.remitente, src.direccion_remitente, src.tipo_de_envi, src.direccion_remitente, src.tipo_de_envio, code.code.to_s]
        #row = row + [src.remitente, src.direccion_remitente, src.tipo_de_envio]
        # row = row 
        # f.write(row.to_csv) # Aqui e la escritura

