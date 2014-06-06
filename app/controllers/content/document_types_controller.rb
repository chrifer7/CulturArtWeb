class Content::DocumentTypesController < ApplicationController
  # GET /content/document_types
  # GET /content/document_types.json
  def index
    @content_document_types = Content::DocumentType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @content_document_types }
    end
  end

  # GET /content/document_types/1
  # GET /content/document_types/1.json
  def show
    @content_document_type = Content::DocumentType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @content_document_type }
    end
  end

  # GET /content/document_types/new
  # GET /content/document_types/new.json
  def new
    @content_document_type = Content::DocumentType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @content_document_type }
    end
  end

  # GET /content/document_types/1/edit
  def edit
    @content_document_type = Content::DocumentType.find(params[:id])
  end

  # POST /content/document_types
  # POST /content/document_types.json
  def create
    @content_document_type = Content::DocumentType.new(params[:content_document_type])

    respond_to do |format|
      if @content_document_type.save
        format.html { redirect_to @content_document_type, notice: 'Document type was successfully created.' }
        format.json { render json: @content_document_type, status: :created, location: @content_document_type }
      else
        format.html { render action: "new" }
        format.json { render json: @content_document_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /content/document_types/1
  # PUT /content/document_types/1.json
  def update
    @content_document_type = Content::DocumentType.find(params[:id])

    respond_to do |format|
      if @content_document_type.update_attributes(params[:content_document_type])
        format.html { redirect_to @content_document_type, notice: 'Document type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @content_document_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content/document_types/1
  # DELETE /content/document_types/1.json
  def destroy
    @content_document_type = Content::DocumentType.find(params[:id])
    @content_document_type.destroy

    respond_to do |format|
      format.html { redirect_to content_document_types_url }
      format.json { head :no_content }
    end
  end
end
