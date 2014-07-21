class Content::HeritageAttribute < ActiveRecord::Base
  attr_accessible :content_heritage_id, :content_attribute_id, :value
  
  validates :value, presence: true
  
  belongs_to :content_heritage, inverse_of: :heritage_attributes, :class_name => 'Content::Heritage', :foreign_key => 'content_heritage_id'
  belongs_to :content_attribute, inverse_of: :heritage_attributes, :class_name => 'Content::Attribute', :foreign_key => 'content_attribute_id'
  
  def is_num?
    begin
      !!Integer(value)
    rescue ArgumentError, TypeError
      false
    end
  end
  
end

# class ContentHeritagesContentAttributes < ActiveRecord::Base
  # attr_accessible :value
# end
