class CreateContentHeritages < ActiveRecord::Migration
  def change
    create_table :content_heritages do |t|
      t.string :name
      t.text :description
      t.text :brief_history
      t.float :extention
      t.decimal :lat
      t.decimal :lon
      t.float :alt
      t.float :perimeter
      t.text :geo_location
      t.text :access_routes

      t.timestamps
    end
  end
end