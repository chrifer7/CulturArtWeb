class Content::AttributeType < ActiveRecord::Base
  attr_accessible :description, :name
  
  validates :name, presence: true
  
  has_many :list_attributes, :class_name => 'Content::Attribute', :foreign_key => 'attribute_type_id' 
end
