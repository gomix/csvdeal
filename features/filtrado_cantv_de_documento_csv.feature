# language: es

Característica: Filtrado CANTV de documento CSV
  Dado un documento original CSV, se debe poder procesar/filtrar y generar
  un nuevo documento CSV con las especificaciones necesarias para su impresión

  Escenario: Descarga de CSV filtrado CANTV
    Dado que existe documento CSV cargado con la opción filtrado CANTV 
    Y que el usuario presiona el enlace para descargar el archivo filtrado CANTV
    Entonces se obtendrá el documento CSV apto para las guías de consignación CANTV
