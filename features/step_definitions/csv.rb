Dado(/^que se quiere registrar un archivo CSV$/) do
  visit('/documentos/new') 
  attach_file('documento_csv_file', File.join(Rails.root, 'test', 'csv', 'items.csv'))
end

# TODO: OJO aqui, se parecen mucho
Dado(/^especifica que el filtro a aplicar es CANTV$/) do
  page.should have_css("form#new_documento")
  #page.has_css?('form#new_documento').should eq true
  page.select('CANTV', :from => 'filtro').should eq "selected"
end
# TODO: es más, creo que ya no se usa el paso siguiente
Dado(/^que se selecciona el filtro cantv de una lista desplegable$/) do
  page.has_css?('form#filtro').should eq true
  page.select('CANTV', :from => 'filtro').should eq "selected"
end
#

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

Dado(/^que el usuario presiona el enlace para descargar el archivo original$/) do
  # TODO desacoplar del texto en el enlace
  page.has_link?("Original").should eq true
  click_link 'Original'
end

Entonces(/^se obtendrá un documento descargable con el documento original$/) do
  page.text.should eql("nombre,apellidos foo,bar juan,bimba")
end

Dado(/^que existe documento CSV cargado con la opción filtrado CANTV$/) do
  visit('/documentos/new') 
  page.select('CANTV', :from => 'filtro').should eq "selected"
  attach_file('documento_csv_file', File.join(Rails.root, 'test', 'csv', 'items-cantv.csv'))
  # TODO: Desacoplar del texto
  click_button('Enviar')
end

Dado(/^que el usuario presiona el enlace para descargar el archivo filtrado CANTV$/) do
  # TODO: Desacoplar del texto
  click_link 'Filtrado para CANTV'
end

Entonces(/^se obtendrá el documento CSV apto para las guías de consignación CANTV$/) do
  page.text.should eql("nombre,apellidos,direccion foo,bar,campos,separados,piso juan,bimba,campos,separados,piso")
end

Entonces(/^se obtendrá un documento descargable$/) do
  pending # express the regexp above with the code you wish you had
end

Entonces(/^ofrecerá la opción de seguir ordenando por otro criterio adicional$/) do
    pending # express the regexp above with the code you wish you had
end

Dado(/^con el criterio ascendente$/) do
    pending # express the regexp above with the code you wish you had
end

Entonces(/^el sistema procedera a ordenar el documento según el criterio dado$/) do
    pending # express the regexp above with the code you wish you had
end

Dado(/^el usuario escoge ordenar por alguno de los campos existentes$/) do
    pending # express the regexp above with the code you wish you had
end

Entonces(/^ofrecerá la opción de descarga del documento ordenado$/) do
    pending # express the regexp above with the code you wish you had
end

Dado(/^que existe un documento CSV cargado con el filtro CANTV$/) do
  visit('/documentos/new') 
  page.select('CANTV', :from => 'filtro').should eq "selected"
  attach_file('documento_csv_file', File.join(Rails.root, 'test', 'csv', 'items-cantv.csv'))
  # TODO: Desacoplar del texto
  click_button('Enviar')
end

Dado(/^el usuario selecciona el campo por el cual desea ordenar$/) do
  page.select('estado', :from => 'campo').should eq "selected"
end

Dado(/^el usuario selecciona el criterio de ordenamiento ascendente$/) do
  page.select('ascendente', :from => 'ascendente').should eq "selected"
end

Cuando(/^el usuario presione el botón correspondiente para ordenar$/) do
  # TODO: desacoplar del texto en el botón
  click_button('Ordenar')
end

Entonces(/^el sistema confirmará la solicitud del usuario$/) do
  # Verificar que llegan params
  page.has_css?('p#status', :text => "0", :visible => false).should eq true
end

Entonces(/^cuando termine de ordenar dicho documento, aparecerá el enlace para su descarga$/) do
  pending # express the regexp above with the code you wish you had
end
