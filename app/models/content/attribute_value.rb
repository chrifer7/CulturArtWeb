class Content::AttributeValue < ActiveRecord::Base
  attr_accessible :attribute_id, :description, :icon, :name
  
  validates :name, presence: true
  validates :obj_attribute, presence: true
  
  belongs_to :obj_attribute, inverse_of: :list_attribute_values, :class_name => 'Content::Attribute', :foreign_key => 'attribute_id'
  
  # has_and_belongs_to_many :content_heritages, :join_table => "content_heritage_attribute_values", :class_name => "Content::Heritage", :foreign_key => 'content_attribute_value_id'
  
  has_many :heritage_attrib_values, :class_name => 'Content::HeritageAttributeValue', :foreign_key => 'content_attribute_value_id'
  has_many :content_heritages, through: :heritage_attrib_values, source: :content_heritages
  
  
end
