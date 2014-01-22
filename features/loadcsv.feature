# language: es

Característica: Soporte de documentos CSV
	Para efectos de la captura de datos por parte del cliente para EME
	el sistema debe poder ofrecer una interfaz para cargar electrónicamente
	vía Web dichos documentos, así como ofrecer facilidades para preclasificación
 	y ordenado de dichos CSV para preprocesarlos antes de la impresión.

  Escenario: Carga Web de documento CSV
	Dado que se visita la página para SubirDatosCSV
	Y especifica el archivo anexo a subir
	Y presiona el botón de CargarDocumento CSV al sistema
	Entonces la carga del documento debe ser registrada en el sistema
	Y el documento CSV, almacenado en el sistema
	Y el documento CSV debe ser interpretado (parseado)
	
  Escenario: Ordenamiento por campo dado de un documento CSV
	Dado que existe un documento CSV FacturacionCANTVEnero2013
	Y que se visita la pagina de vista de dicho documento
	Y el usuario escoge ordenar por alguno de los campos
	Y con el criterio ascendente
	Y presiona procesar
	Entonces el sistema procedera a ordenar el documento según el criterio dado
	Y ofrecerá la opción de seguir ordenando por otro criterio adicional
	Y ofrecerá la opción de descarga del documento ordenado
	
