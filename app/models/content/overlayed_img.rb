class Content::OverlayedImg < ActiveRecord::Base
  attr_accessible :alt_img, :alt_user, :heritage_id, :history, :lat_img, :lat_user, :lon_img, :lon_user, :name, :url
  
  validates :name, presence: true
  
  belongs_to :obj_collection, :class_name => 'Content::Heritage', :foreign_key => 'heritage_id'
end