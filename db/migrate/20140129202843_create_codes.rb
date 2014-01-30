class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :code, :limit => 14
      t.boolean :tomado
      t.timestamps
    end
  end
end
