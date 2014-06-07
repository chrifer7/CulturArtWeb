class CreateContentDocuments < ActiveRecord::Migration
  def self.up
    create_table :content_documents do |t|
      t.string :name
      t.text :description
      t.string :url
      t.string :document_file_name
      t.string :document_content_type

      t.timestamps
    end
  end
  
  def self.down
    drop_table :content_documents
  end
end
