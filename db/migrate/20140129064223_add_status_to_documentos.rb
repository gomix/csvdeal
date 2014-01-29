class AddStatusToDocumentos < ActiveRecord::Migration
  def change
    add_column :documentos, :ordenando_uuid, :string
    add_column :documentos, :ordenando, :boolean
  end
end
