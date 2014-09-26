class Content::AttributeValuesController < ApplicationController
  # GET /content/attribute_values
  # GET /content/attribute_values.json
  def index
    @content_attribute_values = Content::AttributeValue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @content_attribute_values }
    end
  end

  # GET /content/attribute_values/1
  # GET /content/attribute_values/1.json
  def show
    @content_attribute_value = Content::AttributeValue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @content_attribute_value }
    end
  end

  # GET /content/attribute_values/new
  # GET /content/attribute_values/new.json
  def new
    @content_attribute_value = Content::AttributeValue.new

    @attr_type_textbox = Content::AttributeType.where(name: 'TextBox').first_or_create
    @content_attributes = Content::Attribute.where(["attribute_type_id != ?", @attr_type_textbox])
    if @content_attributes.blank?
      @content_attributes = []
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @content_attribute_value }
    end
  end

  # GET /content/attribute_values/1/edit
  def edit
    @content_attribute_value = Content::AttributeValue.find(params[:id])
    
    @attr_type_textbox = Content::AttributeType.where(name: 'TextBox').first_or_create
    @content_attributes = Content::Attribute.where(["attribute_type_id != ?", @attr_type_textbox])
    if @content_attributes.blank?
      @content_attributes = []
    end
    
  end

  # POST /content/attribute_values
  # POST /content/attribute_values.json
  def create
    @content_attribute_value = Content::AttributeValue.new(params[:content_attribute_value])
    
    @attr_type_textbox = Content::AttributeType.where(name: 'TextBox').first_or_create
    @content_attributes = Content::Attribute.where(["attribute_type_id != ?", @attr_type_textbox])
    if @content_attributes.blank?
      @content_attributes = []
    end

    respond_to do |format|
      if @content_attribute_value.save
        format.html { redirect_to @content_attribute_value, notice: 'Attribute value was successfully created.' }
        format.json { render json: @content_attribute_value, status: :created, location: @content_attribute_value }
      else
        format.html { render action: "new" }
        format.json { render json: @content_attribute_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /content/attribute_values/1
  # PUT /content/attribute_values/1.json
  def update
    @content_attribute_value = Content::AttributeValue.find(params[:id])
    
    @attr_type_textbox = Content::AttributeType.where(name: 'TextBox').first_or_create
    @content_attributes = Content::Attribute.where(["attribute_type_id != ?", @attr_type_textbox])
    if @content_attributes.blank?
      @content_attributes = []
    end

    respond_to do |format|
      if @content_attribute_value.update_attributes(params[:content_attribute_value])
        format.html { redirect_to @content_attribute_value, notice: 'Attribute value was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @content_attribute_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content/attribute_values/1
  # DELETE /content/attribute_values/1.json
  def destroy
    @content_attribute_value = Content::AttributeValue.find(params[:id])
    @content_attribute_value.destroy

    respond_to do |format|
      format.html { redirect_to content_attribute_values_url }
      format.json { head :no_content }
    end
  end
end
