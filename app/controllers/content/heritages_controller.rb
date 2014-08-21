class Content::HeritagesController < ApplicationController
  # GET /content/heritages
  # GET /content/heritages.json
  def index
    @content_heritages = Content::Heritage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @content_heritages }
    end
  end

  # GET /content/heritages/1
  # GET /content/heritages/1.json
  def show
    @content_heritage = Content::Heritage.find(params[:id])
  
    @attributes = Content::Attribute.all
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @content_heritage }
    end
  end

  # GET /content/heritages/new
  # GET /content/heritages/new.json
  def new
    @content_heritage = Content::Heritage.new

    @attributes = Content::Attribute.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @content_heritage }
    end
  end

  # GET /content/heritages/1/edit
  def edit
    @content_heritage = Content::Heritage.find(params[:id])

    @attributes = Content::Attribute.all
  end

  # POST /content/heritages
  # POST /content/heritages.json
  def create
    @content_heritage = Content::Heritage.new(params[:content_heritage])

    respond_to do |format|
      if @content_heritage.save
        format.html { redirect_to @content_heritage, notice: 'Heritage was successfully created.' }
        format.json { render json: @content_heritage, status: :created, location: @content_heritage }
      else
        format.html { render action: "new" }
        format.json { render json: @content_heritage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /content/heritages/1
  # PUT /content/heritages/1.json
  def update
    @content_heritage = Content::Heritage.find(params[:id])

    respond_to do |format|
      if @content_heritage.update_attributes(params[:content_heritage])
        format.html { redirect_to @content_heritage, notice: 'Heritage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @content_heritage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content/heritages/1
  # DELETE /content/heritages/1.json
  def destroy
    @content_heritage = Content::Heritage.find(params[:id])
    @content_heritage.destroy

    respond_to do |format|
      format.html { redirect_to content_heritages_url }
      format.json { head :no_content }
    end
  end

  # GET
  def form_extra_fields
    @attributes = Content::Attribute.all

    render partial: "frm_extra"
  # respond_to do |format|
  # format.html { render action: "extra_fields" } #{ redirect_to content_heritages_url, notice: 'Extrafields actualizados' } #@content_heritage, notice: 'Heritage was successfully created.'
  # format.json { head render :json => @attributes, :status => :created, :location => @attributes }
  # end
  end

  # POST
  def save_extra_fields
    # @attributes = Content::Attribute.all
    @content_heritage = Content::Heritage.find(params[:heritage_id])
    logger.info ">>> [OJO] save_extra_fields"
    
    cantRowsAffected = 0
    
    parametros = []
    #Creamos una arreglo de parámetros inlcuyendo los arreglos de los multiselect (aplanado)
    params.each do |slug, value|
      if slug && value
        if value.kind_of?(Array)
          value.each do |val_multi|
            parametros.push [slug, val_multi]  
          end
        else
          parametros.push [slug, value]
        end
      end
    end
    
    #attrib values para borrar después
    rmv_heritage_attrib_values = @content_heritage.heritage_attrib_values
    rmv_heritage_attrib_values_ids = rmv_heritage_attrib_values.map { |a_V| a_V.content_attribute_value_id }  
        
    logger.info ">>values_ids[]: "+rmv_heritage_attrib_values_ids.map(&:inspect).join(', ')
    
    # connection = ActiveRecord::Base.connection.raw_connection
    parametros.each do |slug_value|
      slug = slug_value[0]
      value = slug_value[1]
      
      logger.info "slug: "+slug+", value: "+value
      @attrib = Content::Attribute.where(["slug = ?", slug]).first
      if !@attrib.blank? && !value.blank?
        logger.info "attrib: "+@attrib.name+" heri: "+@content_heritage.id.to_s+" att_id: "+@attrib.id.to_s+" value: "+value
        logger.info "type: "+@attrib.obj_attribute_type.name
        if @attrib.obj_attribute_type.name == "TextBox" or @attrib.obj_attribute_type.name == "TextArea"
          #Si es un texto o número se almacena en HeritageAttribute (que tiene un campo value para la relación)
          cantRowsAffected += @content_heritage.updateOrInsertHeritageAttribute value, @content_heritage.id, @attrib.id            
        else
          #Caso contrario, se almacena en la tabla HeritageAttributeValue, que relaciona valores de atributos
          #con los patrimonios, como por ejem: Cronologia: Temprana | Tardía
          value = value.to_i #Es un ID
          
          #si el attrib value no está entre los elementos antiguos, insertalo
          if !rmv_heritage_attrib_values_ids.include? value
            logger.info "no existe, insertar "+value.to_s
            cantRowsAffected +=  @content_heritage.insertHeritageAttributeValues @content_heritage.id, value
            logger.info "cantRowsAffected "+cantRowsAffected.to_s
          #caso contrario, eliminalo de la lista para borrar, debe quedar allí
          else
            logger.info "si existe, sacar del array rmv "+value.to_s
            rmv_heritage_attrib_values_ids.delete(value)
          end          
        end
        
      else
        logger.info "attrib: es blank"
      end
    end
    
    logger.info "rmv_heritage_attrib_values_ids: "+rmv_heritage_attrib_values_ids.map(&:inspect).join(', ')
    #Elimina los attrib values
    @content_heritage.removeHeritageAttribValues @content_heritage.id, rmv_heritage_attrib_values_ids
    
    if cantRowsAffected > 0
      # format.html { redirect_to @content_heritage, notice: 'Heritage was successfully updated.' }
      # format.html { redirect_to :controller => 'content/heritage', :action => 'edit', :id=> @content_heritage.id }
      # render :partial =>"save_extra"
      render json: {status: "ok"}
    else
      # format.html { render action: "edit" }
      render json: {status: "error"}
    end
  end

  # CREATE OR REPLACE FUNCTION distance (Lat1 IN double precision,
  # Lon1 IN double precision,
  # Lat2 IN double precision,
  # Lon2 IN double precision) RETURNS double precision AS $$
  #
  # DECLARE
  # -- Convert degrees to radians
  # DegToRad real := 0.01745329251994329576923690768489;--57.29577951;
  # ERadius double precision := 6371;
  #
  # X double precision;
  # Y double precision;
  #
  # BEGIN
  # Lat1 := Lat1 * DegToRad;
  # Lon1 := Lon1 * DegToRad;
  # Lat2 := Lat2 * DegToRad;
  # Lon2 := Lon2 * DegToRad;
  #
  # X := (Lon2 - Lon1)  * Cos((Lat1 + Lat2) / 2);
  # Y := (Lat2 - Lat1);
  #
  # RETURN SQRT(X*X + Y*Y) * ERadius;
  # END;
  # $$ LANGUAGE plpgsql;

  # GET
  def find
    if (params[:lat].blank?)
      params[:lat] = -12.067412
    end
    if (params[:lon].blank?)
      params[:lon] = -77.080974
    end
    if (params[:rad].blank?)
      params[:rad] = 10.0
    end
    
    @max_pois = 25
    @i_poi = 0

    @lat = params[:lat].to_d
    @lon = params[:lon].to_d
    @rad = params[:rad].to_d

    if @rad.blank? || @rad < 0 || @rad > 20
      @rad = 1000
    end
    
    #kilometros a metros
    @rad = @rad * 1000
    
    # @rad = 70000 #para hacer unas pruebas
    logger.info "lat: "+@lat.to_s
    logger.info "lon: "+@lon.to_s

    @content_heritages = Content::Heritage.find(:all).sort{|x,y| x.distance(@lat, @lon) <=> y.distance(@lat, @lon) }
    # @content_heritages = Content::Heritage.all
    # @content_heritages.sort {|a,b| a.distance(@lat, @lon) <=> b.distance(@lat, @lon)}
    
    @distances_array = []
    
    @content_heritages_result = []
    i_result = 0
    logger.info "herigates size: "+@content_heritages.size.to_s
    #si tenemos una lon y lat
    if !@lat.blank? && !@lon.blank?
      #recorreo todos los patrimonios
      @content_heritages.each do |heritage|
        # logger.info "heritage: "+heritage.name.to_s
        #obten la distancia
        @d = heritage.distance(@lat, @lon)
        
        @distances_array.push "heritage: "+heritage.name.to_s+"distance: "+@d.to_s

        # logger.info "distance: "+@d.to_s
        # logger.info "radio: "+@rad.to_s

        # logger.info "d < rad: "+(@d <= @rad).to_s
        #si la distancia está fuera del radio
        if @d <= @rad
          #agrega a la nueva lista
          @content_heritages_result.push heritage
          i_result += 1
            
          # @content_heritages.delete heritage
        end
        
        if i_result > @max_pois
          break
        end
            
        # logger.info "herigates size: "+@content_heritages_result.size.to_s
      end
    end
        
    @attributes = Content::Attribute.all

    render :file => "content/heritages/find.json.erb", :content_type => 'application/json', :locals => { :heritages => @content_heritages_result }

  # respond_to do |format|
  # format.html # find.html.erb
  # format.json { render json: @content_heritages }
  # end
  end
  
  def hc
    @content_heritage = Content::Heritage.find(1)

    @heritage_attributes = Content::HeritageAttribute.all

    @h_a = Content::HeritageAttribute.new(:content_heritage_id => 1, :content_attribute_id => 3, :value => "thanks esto es la neta")
    # @h_a.save

    # @content_heritage.heritage_attributes.push @h_a
    # @content_heritage.save

    # @h_b = Content::HeritageAttribute.find(:content_heritage_id => 1, :content_attribute_id => 1)
    @h_b = Content::HeritageAttribute.where(["content_heritage_id = ?  AND content_attribute_id = ?",1,1]).first

    @attrib = Content::Attribute.where(["slug = ?", "morfologia"]).first

    # RSpec.configure do |config|
      # # ... other code
#     
      # config.after(:suite) do
        # ActiveRecord::Base.connection.execute("DEALLOCATE ALL")
      # end
#     
      # # ... other code
    # end
  end
  
  
  def hv
    @content_heritage = Content::Heritage.find(1)

    @heritage_attribute_value = Content::AttributeValue.find(1)
    
    # @h_v = Content::HeritageAttributeValue.new(:content_heritage_id => 1, :content_attribute_value_id => 1)
    # @h_v.save
  end
  
end

# {
# filed1: <%= @some_var %>,
# field2: <%= @another_var %>,
# fieldN: <%= @yet_another_var %>,
# data: <%= @some_data.to_json.html_safe %>
# }


# @heritage_attrib = Content::HeritageAttribute.where(["content_heritage_id = ?  AND content_attribute_id = ?", @content_heritage.id, @attrib.id]).first_or_initialize.update_attributes!(:content_heritage_id => @content_heritage.id, :content_attribute_id => @attrib.id, :value => value)
        
# connection = ActiveRecord::Base.connection.raw_connection
# connection.prepare("update_heritage_attributes_"+@content_heritage.id.to_s+"_"+@attrib.slug, "update content_heritage_attributes set value=$1 where content_heritage_id=$2 and content_attribute_id=$3")
# st = connection.exec_prepared("update_heritage_attributes_"+@content_heritage.id.to_s+"_"+@attrib.slug, [value, @content_heritage.id, @attrib.id])
# connection.reset

# @st = ActiveRecord::Base.connection.raw_connection.prepare("update_heritage_attributes", "update content_heritage_attributes set value=$1 where content_heritage_id=$2 and content_attribute_id=$3")
# @st.exec_prepared("update_heritage_attributes", value, @content_heritage.id, @attrib.id)
# @st.close

# @heritage_attrib = Content::HeritageAttribute.where(["content_heritage_id = ?  AND content_attribute_id = ?", @content_heritage.id, @attrib.id]).first
# @heritage_attrib.value = value
# logger.info "  ha_value: "+@heritage_attrib.value
# @heritage_attrib.save


# @attributes.each do |attribute|
  # logger.info "Slug: "+attribute.slug+" = "+params[attribute.slug]+", blanko? "+(!params[attribute.slug].blank?).to_s
  # if !params[attribute.slug].blank? #Para cada atributo que contiene datos
  # logger.info "heritage: "+@content_heritage.name
  # logger.info "size: "+@content_heritage.list_attributes.create()
  # logger.info @content_heritage
  # # @heritage_attribute.list_heritage_attributes.find()
  # end
  # end

  # respond_to do |format|
  # if @attributes.save
  # format.html { redirect_to "content/heritage_fields/frm_extra", notice: 'Creación satisfactoria' }
  # format.js   {}
  # format.json { render json: @attributes, status: :created, location: @attributes }
  # else
  # format.html { render action: "form_extra_fields" }
  # format.json { render json: @attributes.errors, status: :unprocessable_entity }
  # end
  # end
  # respond_to do |format|
  # format.html { redirect_to "content/heritage_fields/frm_extra", notice: 'Extrafields actualizados' } #@content_heritage, notice: 'Heritage was successfully created.'
  # format.json { render :json => @attributes }
  # end