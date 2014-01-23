# language: es

Característica: Soporte de documentos CSV
	Para efectos de la captura de datos por parte del cliente para EME
	el sistema debe poder ofrecer una interfaz para cargar electrónicamente
	vía Web dichos documentos, así como ofrecer facilidades para preclasificación
 	y ordenado de dichos CSV para preprocesarlos antes de la impresión.

  @wip
  Escenario: Carga Web de documento CSV 
	Dado que se quiere registrar un archivo .csv
	Y el usuario lo carga en el sistema
	Entonces la carga debe ser registrada en el sistema
	Y el documento almacenado en el sistema
	Y el documento debe ser interpretado (parseado)
	
  Escenario: Ordenamiento por campos dado un documento
	Dado que existe un documento 
	Y el usuario escoge ordenar por alguno de los campos existentes
	Y con el criterio ascendente
	Entonces el sistema procedera a ordenar el documento según el criterio dado
	Y ofrecerá la opción de seguir ordenando por otro criterio adicional
	Y ofrecerá la opción de descarga del documento ordenado
	
