class CreateContentAttributeTypes < ActiveRecord::Migration
  def self.up
    create_table :content_attribute_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
  
  def self.down
    drop_table :content_attribute_types
  end
end
