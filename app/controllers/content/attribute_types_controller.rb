class Content::AttributeTypesController < ApplicationController
  # GET /content/attribute_types
  # GET /content/attribute_types.json
  def index
    @content_attribute_types = Content::AttributeType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @content_attribute_types }
    end
  end

  # GET /content/attribute_types/1
  # GET /content/attribute_types/1.json
  def show
    @content_attribute_type = Content::AttributeType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @content_attribute_type }
    end
  end

  # GET /content/attribute_types/new
  # GET /content/attribute_types/new.json
  def new
    @content_attribute_type = Content::AttributeType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @content_attribute_type }
    end
  end

  # GET /content/attribute_types/1/edit
  def edit
    @content_attribute_type = Content::AttributeType.find(params[:id])
  end

  # POST /content/attribute_types
  # POST /content/attribute_types.json
  def create
    @content_attribute_type = Content::AttributeType.new(params[:content_attribute_type])

    respond_to do |format|
      if @content_attribute_type.save
        format.html { redirect_to @content_attribute_type, notice: 'Attribute type was successfully created.' }
        format.json { render json: @content_attribute_type, status: :created, location: @content_attribute_type }
      else
        format.html { render action: "new" }
        format.json { render json: @content_attribute_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /content/attribute_types/1
  # PUT /content/attribute_types/1.json
  def update
    @content_attribute_type = Content::AttributeType.find(params[:id])

    respond_to do |format|
      if @content_attribute_type.update_attributes(params[:content_attribute_type])
        format.html { redirect_to @content_attribute_type, notice: 'Attribute type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @content_attribute_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content/attribute_types/1
  # DELETE /content/attribute_types/1.json
  def destroy
    @content_attribute_type = Content::AttributeType.find(params[:id])
    @content_attribute_type.destroy

    respond_to do |format|
      format.html { redirect_to content_attribute_types_url }
      format.json { head :no_content }
    end
  end
end
