class Documento < ActiveRecord::Base
  attr_accessible :csv_file
  has_attached_file :csv_file

  def filtrar(filtro)
    # /documentos/:id?filtro=:fitro_id debería ser enrutado aquí con GET
    # entonces el modelo contiene la funcionalidad para aplicar el filtro dado
    # y devolver el documentado filtrado 
    logger.debug "Documento, filtrando con #{filtro}"
    
    case filtro
    when 'cantv' then filtro_cantv
    when 'fanb' then filtro_fanb
    when 'armada' then filtro_armada
    else filtro_por_omision
    end
  end

  def filtro_cantv
    # Reglas de filtrado para documentos CSV CANTV
    self
  end
  
  def filtro_fanb
    # Reglas de filtrado para documentos CSV FANB
    #csv_file.path ruta absoluta del archivo cargado original
    self
  end
  
  def filtro_armada
    # Reglas de filtrado para documentos CSV FANB Armada
    self
  end
  
  def filtro_por_omision
    # Reglas de filtrado para documentos CSV CANTV
    self
  end

end
