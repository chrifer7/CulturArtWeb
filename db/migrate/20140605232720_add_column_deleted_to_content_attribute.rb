class AddColumnDeletedToContentAttribute < ActiveRecord::Migration
  def self.up
    add_column :content_attributes, :deleted, :integer
  end
  
  def self.down
    remove_column :content_attributes, :deleted
  end
end
