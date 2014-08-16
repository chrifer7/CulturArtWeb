class DropTableContentHeritagesAttributes < ActiveRecord::Migration
  def up
    drop_table :content_heritages_attributes
  end

  def down
    create_table :content_heritages_attributes, :id => false do |t|
        t.belongs_to :content_heritage
        t.belongs_to :content_attribute
        t.text :value
        
        t.timestamps
    end
  end
end
