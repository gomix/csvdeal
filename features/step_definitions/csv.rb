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
  pending
end
