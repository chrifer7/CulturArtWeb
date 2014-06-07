class AddColumnDeletedToContentHeritage < ActiveRecord::Migration
  def self.up
    add_column :content_heritages, :deleted, :integer
  end
  
  def self.down
    remove_column :content_heritages, :deleted
  end
end
