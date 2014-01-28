# language: es
@wip
Característica: Ordenamiento de documento CSV

  Escenario: Ordenamiento ascendente dado un campo de un documento CSV CANTV
    Dado que existe un documento CSV cargado con el filtro CANTV
    Y el usuario selecciona el campo por el cual desea ordenar
    Y el usuario selecciona el criterio de ordenamiento ascendente
    Cuando el usuario presione el botón correspondiente para ordenar
    Entonces el sistema confirmará la solicitud del usuario
    Y cuando termine de ordenar dicho documento, aparecerá el enlace para su descarga
	
