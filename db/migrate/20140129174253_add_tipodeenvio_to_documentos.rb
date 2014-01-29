class AddTipodeenvioToDocumentos < ActiveRecord::Migration
  def change
    add_column :documentos, :tipo_de_envio, :string
  end
end
