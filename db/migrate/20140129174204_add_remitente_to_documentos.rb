class AddRemitenteToDocumentos < ActiveRecord::Migration
  def change
    add_column :documentos, :remitente, :string
  end
end
