# language: es

Característica: Descarga de documento original CSV

  Antecedentes:
    Dado que existen CSV ya cargados	
    Y que el usuario visita el listado de documentos
    Y que el usuario selecciona el primero de la lista para mostrar

  Escenario: Descarga del archivo original
    Dado que el usuario presiona el enlace para descargar el archivo original
    Entonces se obtendrá un documento descargable con el documento original
