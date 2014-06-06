class CreateContentDocuments < ActiveRecord::Migration
  def change
    create_table :content_documents do |t|
      t.string :name
      t.text :description
      t.string :url
      t.string :document_file_name
      t.string :document_content_type

      t.timestamps
    end
  end
end
