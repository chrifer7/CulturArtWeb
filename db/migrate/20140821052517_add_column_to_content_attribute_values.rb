class AddColumnToContentAttributeValues < ActiveRecord::Migration
  def self.up
    add_column :content_attribute_values, :color, :integer, default: 0xFFFFFF
  end
  
  def self.down
    remove_column :content_attribute_values, :color
  end
end
