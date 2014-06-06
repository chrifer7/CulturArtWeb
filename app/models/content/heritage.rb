class Content::Heritage < ActiveRecord::Base
  attr_accessible :access_routes, :alt, :brief_history, :description, :extention, :geo_location, :lat, :lon, :name, :perimeter
  
  validates :name, presence: true
  
  has_many :list_overlayed_imgs, :class_name => 'Content::OverlayImg', :foreign_key => 'heritage_id'
end
