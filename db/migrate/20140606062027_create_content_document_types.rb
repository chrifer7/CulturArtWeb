class CreateContentDocumentTypes < ActiveRecord::Migration
  def self.up
    create_table :content_document_types do |t|
      t.string :name
      t.text :description
      t.string :icon
      t.string :icon_file_name
      t.string :icon_content_type

      t.timestamps
    end
  end
  
  def self.down
    drop_table :content_document_types
  end
end
