class AddAttachmentCsvFileToDocumentos < ActiveRecord::Migration
  def self.up
    change_table :documentos do |t|
      t.attachment :csv_file
    end
  end

  def self.down
    drop_attached_file :documentos, :csv_file
  end
end
