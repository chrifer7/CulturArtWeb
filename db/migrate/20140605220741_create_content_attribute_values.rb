class CreateContentAttributeValues < ActiveRecord::Migration
  def self.up
    create_table :content_attribute_values do |t|
      t.integer :attribute_id
      t.string :name
      t.text :description
      t.string :icon

      t.timestamps
    end
  end
  
  def self.down
    drop_table :content_attribute_values
  end
end
