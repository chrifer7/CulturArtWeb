class CreateContentHeritageAttributeTable < ActiveRecord::Migration
  def self.up
    create_table :content_heritage_attributes, :id => false do |t|
        t.belongs_to :content_heritage
        t.belongs_to :content_attribute
        t.text :value
        
        t.timestamps
    end    
    
    add_index :content_heritage_attributes, [:content_heritage_id, :content_attribute_id], :unique => true, :name => 'heritage_attribute_id'
    # add_index :content_heritages_content_attributes, :content_attribute_id, :name => 'index_heritages_attributes_a'
    puts 'Adding primary key for :content_heritage_attributes'
    query = 'ALTER TABLE content_heritage_attributes ADD PRIMARY KEY (content_heritage_id, content_attribute_id);'
    ActiveRecord::Base.connection.execute(query)
  end

  def self.down
    remove_index :content_heritage_attributes, :name => 'heritage_attribute_id'
    drop_table :content_heritage_attributes
  end
end
