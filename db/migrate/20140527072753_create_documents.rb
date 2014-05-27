class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.text :description
      t.date :created_on
      t.string :tags, array: true

      t.timestamps
    end
  end
end
