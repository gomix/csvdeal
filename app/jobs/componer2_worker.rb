require 'csv'
class Componiendo2Worker
  @queue = :componiendo2
  
  def self.perform(params)
    src = Documento.find(params["id"].to_i)
    file = src.csv_file.path(:cantv)
    dst = Tempfile.new("cantv")

    File.open(File.expand_path(dst.path),"w+") do |f|
      original = CSV.read(file,{headers: false})
      puts "original.size:#{original.size}"
      pares = []
      original.each { |csv_row| pares << csv_row }
      puts "pares.size:#{pares.size}"

      h = "SerialCANTV1,rif-fecha1,ControlCANTV1,Cliente1,Direccion1,Ciudad1,Estado1,CodigoPostal1,Region1,PesoGramos1,Remitente1,DireccionRemitente1,TipoDeEnvio1,CodigoDeBarra1\n"
      f.write(h)

      pares.size.times { |i|
        code1 = Code.find_by_tomado(false)
        code1.tomado=true
        code1.save
      
        par =   pares[i].to_csv.chomp + 
                ",#{src.remitente.gsub(",", "")}" + 
                ",#{src.direccion_del_remitente.gsub(",", "")}" + 
                ",#{src.tipo_de_envio}" + 
                ",#{code1.code}" 
         
        #puts "i:#{i}"
        #puts "pares[i]:#{pares[i]}"
        #if pares[i]

        #par = "" if par.nil?
                  
        f.write( par + "\n" )
        }
    end
    
    puts "original:#{file}"
    puts "procesado:#{dst.path}"
  end

end

