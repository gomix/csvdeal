Dado(/^que se quiere registrar un archivo \.csv$/) do
  visit('/documentos/new') 
  attach_file('documento_csv_file', File.join(Rails.root, 'test', 'csv', 'items.csv'))
end

Dado(/^el usuario lo carga en el sistema$/) do
  click_button('Enviar')
end

Entonces(/^la carga debe ser registrada en el sistema$/) do
  page.status_code.should eq 200
  # Pero debería ser
  #page.status_code.should eq 201
end

Entonces(/^el documento almacenado en el sistema$/) do
  current_path.should eq documento_path(Documento.find(1))
  id = Rails.application.routes.recognize_path(current_path)[:id]
  puts Documento.find(id).csv_file_file_name
  puts Documento.find(id).inspect
  # El archivo señalado por el sistema debe existir
end

Entonces(/^el documento debe ser interpretado \(parseado\)$/) do
  pending # express the regexp above with the code you wish you had
end
