class CreateContentAttributes < ActiveRecord::Migration
  def change
    create_table :content_attributes do |t|
      t.string :name
      t.text :description
      t.integer :attribute_type_id
      t.integer :data_type_id

      t.timestamps
    end
  end
end
