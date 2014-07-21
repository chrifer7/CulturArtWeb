class AddAvatarColumnToAttributeValues < ActiveRecord::Migration
  def self.up
    remove_column :content_attribute_values, :icon
    
    add_column :content_attribute_values, :icon_file_name, :string
    add_column :content_attribute_values, :icon_content_type, :string
    add_column :content_attribute_values, :icon_file_size, :integer
    add_column :content_attribute_values, :icon_updated_at, :datetime
    
    # add_column :content_attribute_values, :icon, :attachment    
  end
  
  def self.down
    remove_column :content_attribute_values, :icon_file_name
    remove_column :content_attribute_values, :icon_content_type
    remove_column :content_attribute_values, :icon_file_size
    remove_column :content_attribute_values, :icon_updated_at
    
    add_column :content_attribute_values, :icon, :string
    
    # remove_column :content_attribute_values, :icon    
  end
end
