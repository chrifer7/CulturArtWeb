class CreateContentOverlayedImgs < ActiveRecord::Migration
  def self.up
    create_table :content_overlayed_imgs do |t|
      t.string :name
      t.text :history
      t.string :url
      t.decimal :lat_img
      t.decimal :lon_img
      t.float :alt_img
      t.decimal :lat_user
      t.decimal :lon_user
      t.float :alt_user
      t.integer :heritage_id

      t.timestamps
    end
  end
  
  def self.down
    drop_table :content_overlayed_imgs
  end
end
