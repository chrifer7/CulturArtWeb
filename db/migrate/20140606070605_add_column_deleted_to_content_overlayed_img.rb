class AddColumnDeletedToContentOverlayedImg < ActiveRecord::Migration
  def change
    add_column :content_overlayed_imgs, :deleted, :integer
  end
end
