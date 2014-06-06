class Content::Document < ActiveRecord::Base
  attr_accessible :description, :document_content_type, :document_file_name, :name, :url
  
  validates :name, presence: true
  
  
end
