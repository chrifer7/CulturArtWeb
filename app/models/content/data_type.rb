class Content::DataType < ActiveRecord::Base
  attr_accessible :name, :ptype
  
  validates :name, presence: true
  
  has_many :list_attributes, :class_name => 'Content::Attribute', :foreign_key => 'data_type_id'
end
