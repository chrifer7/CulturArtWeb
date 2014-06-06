class CreateContentAttributeValues < ActiveRecord::Migration
  def change
    create_table :content_attribute_values do |t|
      t.integer :attribute_id
      t.string :name
      t.text :description
      t.string :icon

      t.timestamps
    end
  end
end
