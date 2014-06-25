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
    @attributes = Content::Attribute.all
    @content_heritage = Content::Heritage.find(params[:heritage_id])
    logger.info ">>> [OJO] save_extra_fields"
    
    @heritage_attributes = [] #Defino una lista vacía de atributos
    @attributes.each do |attribute|
      logger.info "Slug: "+attribute.slug+" = "+params[attribute.slug]+", blanko? "+(!params[attribute.slug].blank?).to_s
      if !params[attribute.slug].blank? #Para cada atributo que contiene datos
        logger.info "heritage: "+@content_heritage.name
        logger.info "size: "+@content_heritage.list_attributes.create()
        logger.info @content_heritage
        # @heritage_attribute.list_heritage_attributes.find()
      end
    end

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
    @lat = params[:lat].to_d
    @lon = params[:lon].to_d
    @rad = params[:rad].to_d
    
    if @rad.blank? || @rad < 0 || @rad > 20
      @rad = 10
    end
    # @rad = 70000 #para hacer unas pruebas
    logger.info "lat: "+@lat.to_s
    logger.info "lon: "+@lon.to_s
    
    @content_heritages = Content::Heritage.all
    @content_heritages_result = [] 
    logger.info "herigates size: "+@content_heritages.size.to_s
    #si tenemos una lon y lat
    if !@lat.blank? && !@lon.blank?
      #recorreo todos los patrimonios
      @content_heritages.each do |heritage|
        logger.info "heritage: "+heritage.name.to_s
        #obten la distancia
        @d = heritage.distance(@lat, @lon)
        
        logger.info "distance: "+@d.to_s
        logger.info "radio: "+@rad.to_s
        
        logger.info "d < rad: "+(@d <= @rad).to_s
        #si la distancia está fuera del radio
        if @d <= @rad
          #agrega a la nueva lista
          @content_heritages_result.push heritage
          
          # @content_heritages.delete heritage
        end
        
        logger.info "herigates size: "+@content_heritages_result.size.to_s
      end
    end

    render :file => "content/heritages/find.json.erb", :content_type => 'application/json', :locals => { :heritages => @content_heritages_result }
    
    # respond_to do |format|
      # format.html # find.html.erb
      # format.json { render json: @content_heritages }
    # end
  end
  # {
    # filed1: <%= @some_var %>,
    # field2: <%= @another_var %>,
    # fieldN: <%= @yet_another_var %>,
    # data: <%= @some_data.to_json.html_safe %>
  # }
end
