Dado(/^que se quiere registrar un archivo \.csv$/) do
  visit('/documentos/new') 
  attach_file('documento_csv_file', File.join(Rails.root, 'test', 'csv', 'items.csv'))
end

Dado(/^el usuario lo carga en el sistema$/) do
      click_button('Enviar')
#	Y lo envía haciendo click en Enviar
end

Entonces(/^la carga debe ser registrada en el sistema$/) do
  pending # express the regexp above with the code you wish you had
end

Entonces(/^el documento almacenado en el sistema$/) do
  pending # express the regexp above with the code you wish you had
end

Entonces(/^el documento debe ser interpretado \(parseado\)$/) do
  pending # express the regexp above with the code you wish you had
end
