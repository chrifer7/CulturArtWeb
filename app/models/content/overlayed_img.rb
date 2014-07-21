class Content::OverlayedImg < ActiveRecord::Base
  attr_accessible :alt_img, :alt_user, :heritage_id, :history, :lat_img, :lat_user, :lon_img, :lon_user, :name, :url, :avatar
  
  has_attached_file :avatar, :styles => {
                                :thumb => "75x75>",
                                :medium => "600x600>",
                                :high => "1200x1200>",
                              }
  validates :name, presence: true
  
  belongs_to :obj_heritage, :class_name => 'Content::Heritage', :foreign_key => 'heritage_id'
end
