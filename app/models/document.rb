class Document < ActiveRecord::Base
  attr_accessible :created_on, :description, :name, :tags
end
