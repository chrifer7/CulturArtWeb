class Content::Heritage < ActiveRecord::Base
  attr_accessible :access_routes, :alt, :brief_history, :description, :extention, :geo_location, :lat, :lon, :name, :perimeter
  
  validates :name, presence: true
  
  has_many :list_overlayed_imgs, :class_name => 'Content::OverlayImg', :foreign_key => 'heritage_id'
  
  has_and_belongs_to_many :attribute_values #many to many con arrtibutes values
  
  has_many :list_heritage_attributes, :class_name => 'Content::HeritageAttribute', :foreign_key => 'content_heritage_id'
  has_many :list_attributes, through: :list_heritage_attributes
  
  
  def distance plat, plon
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters
    
    logger.info "p: "+plat.to_s+" - "+plon.to_s
    logger.info "h: "+lat.to_s+" - "+lon.to_s
    
    dlon_rad = (plon-lon) * rad_per_deg  # Delta, converted to rad
    dlat_rad = (plat-lat) * rad_per_deg
  
    lat1_rad, lon1_rad = [lat, lon].map! {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = [plat,plon].map! {|i| i * rad_per_deg }
    
    logger.info "p_r: "+lat1_rad.to_s+" - "+lon1_rad.to_s
    logger.info "h_r: "+lat2_rad.to_s+" - "+lon2_rad.to_s
  
    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math.asin(Math.sqrt(a))
  
    rm * c # Delta in meters
  end
  
  # def array_distance a, b
    # rad_per_deg = Math::PI/180  # PI / 180
    # rkm = 6371                  # Earth radius in kilometers
    # rm = rkm * 1000             # Radius in meters
#   
    # dlon_rad = (b[1]-a[1]) * rad_per_deg  # Delta, converted to rad
    # dlat_rad = (b[0]-a[0]) * rad_per_deg
#   
    # lat1_rad, lon1_rad = a.map! {|i| i * rad_per_deg }
    # lat2_rad, lon2_rad = b.map! {|i| i * rad_per_deg }
#   
    # a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    # c = 2 * Math.asin(Math.sqrt(a))
#   
    # rm * c # Delta in meters
  # end
end
