class AddColumnDeletedToContentAttributeType < ActiveRecord::Migration
  def self.up
    add_column :content_attribute_types, :deleted, :integer
  end
  
  def self.down
    remove_column :content_attribute_types, :deleted
  end
end
