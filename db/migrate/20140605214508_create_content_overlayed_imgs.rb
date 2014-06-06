class CreateContentOverlayedImgs < ActiveRecord::Migration
  def change
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
end
