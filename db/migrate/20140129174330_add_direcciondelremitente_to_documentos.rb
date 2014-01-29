class AddDirecciondelremitenteToDocumentos < ActiveRecord::Migration
  def change
    add_column :documentos, :direccion_del_remitente, :string
  end
end
