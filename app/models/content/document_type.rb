class Content::DocumentType < ActiveRecord::Base
  attr_accessible :description, :icon, :icon_content_type, :icon_file_name, :name
  
  validates :name, presence: true
  
end
