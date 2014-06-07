class AddColumnDeletedToContentOverlayedImg < ActiveRecord::Migration
  def self.up
    add_column :content_overlayed_imgs, :deleted, :integer
  end
  
  def self.down
    remove_column :content_overlayed_imgs, :deleted
  end
end
