class CreateContentHeritageAttributeValueTable < ActiveRecord::Migration
  def self.up
    create_table :content_heritage_attribute_values, :id => false do |t|
        t.belongs_to :content_heritage
        t.belongs_to :content_attribute_value
        # t.integer :content_heritage_id
        # t.integer :content_attribute_value_id
        
        t.timestamps
    end    
    
    add_index :content_heritage_attribute_values, [:content_heritage_id, :content_attribute_value_id], :unique => true, :name => 'heritage_attrib_value_id'
#     
    puts 'Adding primary key for :content_heritage_attribute_values'
    query = 'ALTER TABLE content_heritage_attribute_values ADD PRIMARY KEY (content_heritage_id, content_attribute_value_id);'
    ActiveRecord::Base.connection.execute(query)
  end

  def self.down    
    remove_index :content_heritage_attribute_values, :name => 'heritage_attrib_value_id'
    drop_table :content_heritage_attribute_values
  end
end
#llamar a la tabla: attribute_values_heritages

#revisar:
#http://stackoverflow.com/questions/13694654/specifying-column-name-in-a-references-migration
