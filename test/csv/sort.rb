require 'csv'

# 1.- Obtener los nombres únicos (campo por el que se va ordenar)
csv_file = CSV.table("items-cantv-new.csv") 


# sorted =csv_file[0].sort.uniq
sorted = csv_file[:estado].uniq.reverse
res= [] # Array vacío por ejemplo
# Recuperar las líneas en orden, por nombre
sorted.each { |nombre|
  # Verificar el indice 0 si se puede usar "otra" cosa... como por ejemplo :nombre
  csv_file.each { |csv_row| res << csv_row if csv_row[:estado].to_s.eql?(nombre) }
}

p res.to_csv
 
#csf_file.by_row![sacar de la tabla si coincide el nombre
