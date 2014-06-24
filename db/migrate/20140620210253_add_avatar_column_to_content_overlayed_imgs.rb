class AddAvatarColumnToContentOverlayedImgs < ActiveRecord::Migration
  def self.up
    add_column :content_overlayed_imgs, :avatar_file_name, :string
    add_column :content_overlayed_imgs, :avatar_content_type, :string
    add_column :content_overlayed_imgs, :avatar_file_size, :integer
    add_column :content_overlayed_imgs, :avatar_updated_at, :datetime
    
    # add_column :content_overlayed_imgs, :avatar, :attachment    
  end
  
  def self.down
    remove_column :content_overlayed_imgs, :avatar_file_name
    remove_column :content_overlayed_imgs, :avatar_content_type
    remove_column :content_overlayed_imgs, :avatar_file_size
    remove_column :content_overlayed_imgs, :avatar_updated_at
    
    # remove_column :content_overlayed_imgs, :avatar    
  end
end
