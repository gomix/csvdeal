# language: es

Característica: Filtrado CANTV de documento CSV
  Dado un documento original CSV, se debe poder procesar/filtrar y generar
  un nuevo documento CSV con las especificaciones necesarias para su impresión

  Antecedentes:
    Dado que existen CSV ya cargados	
    Y que el usuario visita el listado de documentos
    Y que el usuario selecciona el primero de la lista para mostrar

  @dev
  Escenario: Consulta simple con filtro cantv aplicado
    Dado que se selecciona el filtro cantv de una lista desplegable
    Y que el usario presiona el botón Filtrar
    Entonces se obtendrá un documento descargable
