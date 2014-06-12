class AddColumnToAttribute < ActiveRecord::Migration
  def self.up
    add_column :content_attributes, :slug, :string
    #add_index :moderators, :username, unique: true
  end
  
  def self.down
    remove_column :content_attributes, :slug
  end
end
