class AddAttachmentCsvFiltradoToDocumentos < ActiveRecord::Migration
  def self.up
    change_table :documentos do |t|
      t.attachment :csv_filtrado
    end
  end

  def self.down
    drop_attached_file :documentos, :csv_filtrado
  end
end
