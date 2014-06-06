class Content::Attribute < ActiveRecord::Base
  attr_accessible :attribute_type_id, :data_type_id, :description, :name
  
  validates :name, presence: true
  
  has_many :list_attribute_values, inverse_of: :obj_attribute, :class_name => 'Content::AttributeValue', :foreign_key => 'attribute_id'
  
  belongs_to :obj_attribute_type, :class_name => 'Content::AttributeType', :foreign_key => 'attribute_type_id'
  belongs_to :obj_data_type, :class_name => 'Content::DataType', :foreign_key => 'data_type_id'
end
