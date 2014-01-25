# language: es

Característica: Generación de documentos CSV

  Antecedentes:
    Dado que existen CSV ya cargados
  
  @wip
  Escenario: Generación de CSV piloto para impresion
    Dado que el usuario visita el listado de documentos
    Y que el usuario selecciona el primero de la lista para mostrar
    Entonces al presionar exportar se puede descargar el CSV generado
