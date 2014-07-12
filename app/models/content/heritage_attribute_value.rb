class Content::HeritageAttributeValue < ActiveRecord::Base
  attr_accessible :content_heritage_id, :content_attribute_value_id
       
  belongs_to :content_heritage, inverse_of: :heritage_attrib_values, :class_name => 'Content::Heritage', :foreign_key => 'content_heritage_id'
  belongs_to :content_attribute_value, inverse_of: :heritage_attrib_values, :class_name => 'Content::AttributeValue', :foreign_key => 'content_attribute_value_id'
   
end
