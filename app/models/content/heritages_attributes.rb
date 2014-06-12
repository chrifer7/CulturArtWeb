class Content::HeritageAttribute < ActiveRecord::Base
  attr_accessible :content_heritage_id, :content_attribute_id, :value
  
  validates :name, presence: true
  
  belongs_to :obj_heritage, inverse_of: :list_heritage_attributes, :class_name => 'Content::Attribute', :foreign_key => 'attribute_id'
  belongs_to :obj_attribute, inverse_of: :list_heritage_attributes, :class_name => 'Content::Attribute', :foreign_key => 'attribute_id'
  
end

# class ContentHeritagesContentAttributes < ActiveRecord::Base
  # attr_accessible :value
# end
