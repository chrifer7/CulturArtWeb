class Content::AttributeValue < ActiveRecord::Base
  attr_accessible :attribute_id, :description, :icon, :name, :obj_attribute
  
  has_attached_file :icon, :styles => { 
                                  :medium => "32x32>", 
                                  :high => "48x48>",
                                  :xhigh => "72x72>",
                                  :xxhigh => "96x96>",
                                  :xxxhigh => "144x144>"  
                                }, :default_url => "/assets/img/cat/:style/default.png"
  validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/
  
  validates :name, presence: true
  validates :obj_attribute, presence: true
  validates :attribute_id, presence: true
  
  belongs_to :obj_attribute, inverse_of: :list_attribute_values, :class_name => 'Content::Attribute', :foreign_key => 'attribute_id'
  
  # has_and_belongs_to_many :content_heritages, :join_table => "content_heritage_attribute_values", :class_name => "Content::Heritage", :foreign_key => 'content_attribute_value_id'
  
  has_many :heritage_attrib_values, :class_name => 'Content::HeritageAttributeValue', :foreign_key => 'content_attribute_value_id'
  has_many :content_heritages, through: :heritage_attrib_values, source: :content_heritages
  
  
end
