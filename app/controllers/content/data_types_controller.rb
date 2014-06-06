class Content::DataTypesController < ApplicationController
  # GET /content/data_types
  # GET /content/data_types.json
  def index
    @content_data_types = Content::DataType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @content_data_types }
    end
  end

  # GET /content/data_types/1
  # GET /content/data_types/1.json
  def show
    @content_data_type = Content::DataType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @content_data_type }
    end
  end

  # GET /content/data_types/new
  # GET /content/data_types/new.json
  def new
    @content_data_type = Content::DataType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @content_data_type }
    end
  end

  # GET /content/data_types/1/edit
  def edit
    @content_data_type = Content::DataType.find(params[:id])
  end

  # POST /content/data_types
  # POST /content/data_types.json
  def create
    @content_data_type = Content::DataType.new(params[:content_data_type])

    respond_to do |format|
      if @content_data_type.save
        format.html { redirect_to @content_data_type, notice: 'Data type was successfully created.' }
        format.json { render json: @content_data_type, status: :created, location: @content_data_type }
      else
        format.html { render action: "new" }
        format.json { render json: @content_data_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /content/data_types/1
  # PUT /content/data_types/1.json
  def update
    @content_data_type = Content::DataType.find(params[:id])

    respond_to do |format|
      if @content_data_type.update_attributes(params[:content_data_type])
        format.html { redirect_to @content_data_type, notice: 'Data type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @content_data_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content/data_types/1
  # DELETE /content/data_types/1.json
  def destroy
    @content_data_type = Content::DataType.find(params[:id])
    @content_data_type.destroy

    respond_to do |format|
      format.html { redirect_to content_data_types_url }
      format.json { head :no_content }
    end
  end
end
