class Content::AttributeValue < ActiveRecord::Base
  attr_accessible :attribute_id, :description, :icon, :name
  
  validates :name, presence: true
  validates :obj_attribute, presence: true
  
  belongs_to :obj_attribute, inverse_of: :list_attribute_values, :class_name => 'Content::Attribute', :foreign_key => 'attribute_id'  
end
