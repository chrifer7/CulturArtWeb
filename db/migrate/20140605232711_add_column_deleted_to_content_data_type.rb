class AddColumnDeletedToContentDataType < ActiveRecord::Migration
  def self.up
    add_column :content_data_types, :deleted, :integer
  end
  
  def self.down
    remove_column :content_data_types, :deleted
  end
end
