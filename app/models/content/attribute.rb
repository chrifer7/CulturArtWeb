class Content::Attribute < ActiveRecord::Base
  attr_accessible :attribute_type_id, :data_type_id, :description, :name, :slug, :obj_attribute_type, :obj_data_type 
  
  validates :name, presence: true
  validates_uniqueness_of :slug
  
  has_many :list_attribute_values, inverse_of: :obj_attribute, :class_name => 'Content::AttributeValue', :foreign_key => 'attribute_id'
  
  belongs_to :obj_attribute_type, :class_name => 'Content::AttributeType', :foreign_key => 'attribute_type_id'
  belongs_to :obj_data_type, :class_name => 'Content::DataType', :foreign_key => 'data_type_id'
  
  has_many :heritage_attributes, :class_name => 'Content::HeritageAttribute', :foreign_key => 'content_attribute_id'
  has_many :content_heritages, through: :heritage_attributes, source: :content_heritage
  
  def getBySlug slug
    where(["slug = ?", heritage_id]).first
  end
  
  
end
