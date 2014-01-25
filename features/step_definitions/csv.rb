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

Dado(/^que se selecciona el filtro cantv de una lista desplegable$/) do
  page.has_css?('form#filtro').should eq true
  page.select('CANTV', :from => 'filtro').should eq "selected"
end

Dado(/^que el usario presiona el botón Filtrar$/) do
  click_button('Filtrar')
end

Entonces(/^se obtendrá un documento descargable$/) do
  pending # express the regexp above with the code you wish you had
end

Dado(/^que el usuario presiona el enlace Descargar$/) do
  page.has_link?("Descargar").should eq true
end

Entonces(/^se obtendrá un documento descargable con documento original$/) do
  click_link 'Descargar'
  page.text.should eql("nombre,apellidos foo,bar juan,bimba")
end
