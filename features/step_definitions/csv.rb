############# Escenario 1
Dado(/^que se quiere registrar un archivo CSV$/) do
  visit('/documentos/new') 
  attach_file('documento_csv_file', File.join(Rails.root, 'test', 'csv', 'items.csv'))
end

Dado(/^el usuario lo carga en el sistema$/) do
  click_button('Enviar')
end

Entonces(/^la carga debe ser registrada en el sistema$/) do
  page.status_code.should eq 200
  # Debería ser 201, pero los browsers no manejen esto de la misma manera que con 200
  # La navegación se altera (redirección explícita)
end

Entonces(/^se mostrará mensaje de confirmacion de éxito de la carga del documento CSV$/) do
  page.has_css?('p#status', :text => "0", :visible => false).should eq true
end

############# Escenario 2
Dado(/^que existen CSV ya cargados$/) do
  visit('/documentos/new') 
  attach_file('documento_csv_file', File.join(Rails.root, 'test', 'csv', 'items.csv'))
  click_button('Enviar')
  visit('/documentos')
  page.has_link?("", href: "/documentos/1").should eq true
end

Dado(/^que el usuario visita el listado de documentos$/) do
  visit('/documentos') 
end

Dado(/^que el usuario selecciona el primero de la lista para mostrar$/) do
  visit('/documentos/1') 
end

Entonces(/^al presionar exportar se puede descargar el CSV generado$/) do
  pending # express the regexp above with the code you wish you had
end

