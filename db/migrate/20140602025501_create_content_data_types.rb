class CreateContentDataTypes < ActiveRecord::Migration
  def self.up
    create_table :content_data_types do |t|
      t.string :name
      t.string :ptype

      t.timestamps
    end
  end
  
  def self.down
    drop_table :content_data_types
  end
end
