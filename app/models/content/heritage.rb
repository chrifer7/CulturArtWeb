class Content::Heritage < ActiveRecord::Base
  attr_accessible :access_routes, :alt, :brief_history, :description, :extention, :geo_location, :lat, :lon, :name, :perimeter
  
  validates :name, presence: true
  
  has_many :list_overlayed_imgs, :class_name => 'Content::OverlayedImg', :foreign_key => 'heritage_id'
  
  # has_and_belongs_to_many :content_attribute_values, :join_table => "content_heritage_attribute_values", :class_name => "Content::Attribute", :foreign_key => 'content_heritage_id'
  
  has_many :heritage_attrib_values, :class_name => 'Content::HeritageAttributeValue', :foreign_key => 'content_heritage_id'
  has_many :content_attribute_values, through: :heritage_attrib_values, source: :content_attribute_value
    
  has_many :heritage_attributes, :class_name => 'Content::HeritageAttribute', :foreign_key => 'content_heritage_id'
  has_many :content_attributes, through: :heritage_attributes, source: :content_attribute
  
  
  def distance plat, plon
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters
    
    # logger.info "p: "+plat.to_s+" - "+plon.to_s
    # logger.info "h: "+self.lat.to_s+" - "+self.lon.to_s
    
    dlon_rad = (plon-lon) * rad_per_deg  # Delta, converted to rad
    dlat_rad = (plat-lat) * rad_per_deg
  
    lat1_rad, lon1_rad = [lat, lon].map! {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = [plat,plon].map! {|i| i * rad_per_deg }
    
    # logger.info "p_r: "+lat1_rad.to_s+" - "+lon1_rad.to_s
    # logger.info "h_r: "+lat2_rad.to_s+" - "+lon2_rad.to_s
  
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
  
  def getHeritageAttribute heritage_id, attribute_id
    Content::HeritageAttribute.where(["content_heritage_id = ?  AND content_attribute_id = ?", heritage_id, attribute_id]).first
  end
  
  def getHeritageAttributeValue heritage_id, attribute_value_id
    Content::HeritageAttributeValue.where(["content_heritage_id = ?  AND content_attribute_value_id = ?", heritage_id, attribute_value_id]).first
  end
  
  def findMyValuesByHeritageAndAttribute heritage_id, attribute_id
    attribute = Content::Attribute.find(attribute_id)
    
    Content::HeritageAttributeValue.where(["content_heritage_id = ?  AND content_attribute_value_id = ?", heritage_id, attribute_value_id]).first
  end
  
  #input and textbox
  def updateOrInsertHeritageAttribute value, heritage_id, attribute_id
    connection = ActiveRecord::Base.connection.raw_connection
    
    # connection.prepare("update_heritage_attributes_"+heritage_id.to_s+attribute_id.to_s, "update content_heritage_attributes set value=$1 where content_heritage_id=$2 and content_attribute_id=$3")
    # st = connection.exec_prepared("update_heritage_attributes_"+heritage_id.to_s+attribute_id.to_s, [value, heritage_id, attribute_id])
    
    logger.info "update or insert: heritage:"+ heritage_id.to_s + " attrib:" + attribute_id.to_s + " val: "+ value.to_s
    
    st = connection.exec_params("UPDATE content_heritage_attributes SET value=$1 WHERE content_heritage_id=$2 AND content_attribute_id=$3", [value, heritage_id, attribute_id])
    
    logger.info "Estado de la actualizacion: "+st.cmd_tuples.to_s
    
    rowsAffected = st.cmd_tuples
    
    if rowsAffected <= 0
      @h_a = Content::HeritageAttribute.new(:content_heritage_id => heritage_id, :content_attribute_id => attribute_id, :value => value)
      rowsAffected = @h_a.save ? 1 : 0
      
      logger.info "Estado de la insercion: "+rowsAffected.to_s     
    end
    
    rowsAffected
  end
  
  #Select y Multiselect
  def insertHeritageAttributeValues heritage_id, attribute_value_id
    
    logger.info "insertHeritageAttributeValues h_id: "+heritage_id.to_s+" atv_id: "+attribute_value_id.to_s
    @h_av = Content::HeritageAttributeValue.new(:content_heritage_id => heritage_id, :content_attribute_value_id => attribute_value_id)
    rowsAffected = @h_av.save ? 1 : 0     
    logger.info "rowsAffected: "+rowsAffected.to_s
    
    rowsAffected
  end
  
  def removeHeritageAttribValues heritage_id, heritage_attrib_values_ids
    
    if !heritage_attrib_values_ids.empty?
      connection = ActiveRecord::Base.connection.raw_connection
      
      str_heritage_attrib_values_ids = heritage_attrib_values_ids.map(&:inspect).join(', ')
      logger.info "En el modelo: "+str_heritage_attrib_values_ids
      sql_del = "DELETE FROM content_heritage_attribute_values WHERE content_heritage_id = " + heritage_id.to_s + " AND content_attribute_value_id IN (" + str_heritage_attrib_values_ids + ")"
      st = connection.exec(sql_del)
    end
  end
    
end


# 
# connection = ActiveRecord::Base.connection.raw_connection
#     
# #De todos los valores de este atributo. Por ejemplo:
# #attrib:Morfologia || list_attribute_values: Piramide, Cubo, Esfera
# #Le resto los valores a insertar
# #attrib_values: Piramide, Esfera
# #Entonces debo eliminar, si existiera, la lista 
# #attrib_values_for_delete: Cubo
# #http://stackoverflow.com/questions/5195943/ruby-new-array-from-one-value-in-an-array-of-objects
# 
# attrib_values_for_delete = heritage.heritage_attrib_values - attrib_values
# attrib_values_ids_for_delete = attrib_values_for_delete.map { |a_V| a_v.id }       
# st = connection.exec_params("DELETE FROM content_heritage_attribute_values WHERE content_heritage_id=$1 AND content_attribute_content_attribute_values_id IN ($2)", [heritage_id, attrib_values_ids_for_delete])
# 
# logger.info "Estado de la eliminación: "+st.cmd_tuples.to_s
# 
# attrib_values_for_insert = attrib_values - heritage.heritage_attrib_values
#     
# rowsAffected = 0
#     
# attrib_values_for_insert.each do |att_val_insert|
  # @h_a_v = Content::HeritageAttributeValue.new(:content_heritage_id => heritage.id, :content_attribute_value_id => att_val_insert.id)
  # rowsAffected += @h_a_v.save ? 1 : 0     
# end
# 
# rowsAffected
