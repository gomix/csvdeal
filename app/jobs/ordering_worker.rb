class OrderingWorker
  @queue = :ordering
  
  def self.perform(params)
    puts "campo:#{params["campo"]}" 
    puts "campo:#{params["ascendente"]}" 
    puts "campo:#{params["id"]}" 
    # src, archivo csv fuente a ser ordenado
    src = Documento.find(params["id"].to_i)
    src.csv_file.path(:cantv)
    src.ordenando=true
    src.ordenando_uuid="123"
    src.save
    # Efectivamente ordenamos
    puts "ordenando?#{src.ordenando?.to_s}"
    puts "ordenando_uuid:#{src.ordenando_uuid.to_s}"
    sleep 55
    src.ordenando_uuid=nil
    src.ordenando=false
    src.save
    puts "ordenando?#{src.ordenando?.to_s}"
    puts "ordenando_uuid:#{src.ordenando_uuid.to_s}"
    sleep 5
  end
end
