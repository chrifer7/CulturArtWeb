class Content::AttributesController < ApplicationController
  # GET /content/attributes
  # GET /content/attributes.json
  def index
    @content_attributes = Content::Attribute.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @content_attributes }
    end
  end

  # GET /content/attributes/1
  # GET /content/attributes/1.json
  def show
    @content_attribute = Content::Attribute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @content_attribute }
    end
  end

  # GET /content/attributes/new
  # GET /content/attributes/new.json
  def new
    @content_attribute = Content::Attribute.new

    @attrib_types = Content::AttributeType.all
    @data_types = Content::DataType.all
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @content_attribute }
    end
  end

  # GET /content/attributes/1/edit
  def edit
    @content_attribute = Content::Attribute.find(params[:id])
    
    @attrib_types = Content::AttributeType.all
    @data_types = Content::DataType.all
  end

  # POST /content/attributes
  # POST /content/attributes.json
  def create
    @content_attribute = Content::Attribute.new(params[:content_attribute])

    respond_to do |format|
      if @content_attribute.save
        format.html { redirect_to @content_attribute, notice: 'Attribute was successfully created.' }
        format.json { render json: @content_attribute, status: :created, location: @content_attribute }
      else
        format.html { render action: "new" }
        format.json { render json: @content_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /content/attributes/1
  # PUT /content/attributes/1.json
  def update
    @content_attribute = Content::Attribute.find(params[:id])
    
    respond_to do |format|
      if @content_attribute.update_attributes(params[:content_attribute])
        format.html { redirect_to @content_attribute, notice: 'Attribute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @content_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content/attributes/1
  # DELETE /content/attributes/1.json
  def destroy
    @content_attribute = Content::Attribute.find(params[:id])
    @content_attribute.destroy

    respond_to do |format|
      format.html { redirect_to content_attributes_url }
      format.json { head :no_content }
    end
  end
end
