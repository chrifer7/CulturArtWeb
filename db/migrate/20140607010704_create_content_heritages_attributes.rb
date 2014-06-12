class CreateContentHeritagesAttributes < ActiveRecord::Migration
  def self.up
    create_table :content_heritages_attributes, :id => false do |t|
        t.belongs_to :content_heritage
        t.belongs_to :content_attribute
        t.text :value
        
        t.timestamps
    end
    # add_index :content_heritages_content_attributes, [:content_heritage_id, :content_attribute_id], :name => 'index_heritages_attributes_h_a'
    # add_index :content_heritages_content_attributes, :content_attribute_id, :name => 'index_heritages_attributes_a'
  end

  def self.down
    # remove_index :content_heritages_content_attributes, :column => [:content_heritage_id, :content_attribute_id]
    drop_table :content_heritages_attributes
  end
end

  # def self.up
    # create_join_table :content_heritages, :content_attributes do |t|
      # t.index [:content_heritage_id, :content_attribute_id]
      # t.index [:content_attribute_id, :content_heritage_id]
    # end
  # end  
#   
  # def self.down
    # drop_join_table :content_heritages, :content_attributes 
  # end