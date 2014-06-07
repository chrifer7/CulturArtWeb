class AddColumnDeletedToContentAttributeValue < ActiveRecord::Migration
  def self.up
    add_column :content_attribute_values, :deleted, :integer
  end
  
  def self.down
    remove_column :content_attribute_values, :deleted
  end
end
