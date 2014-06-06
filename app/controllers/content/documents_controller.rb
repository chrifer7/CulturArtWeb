class Content::DocumentsController < ApplicationController
  # GET /content/documents
  # GET /content/documents.json
  def index
    @content_documents = Content::Document.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @content_documents }
    end
  end

  # GET /content/documents/1
  # GET /content/documents/1.json
  def show
    @content_document = Content::Document.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @content_document }
    end
  end

  # GET /content/documents/new
  # GET /content/documents/new.json
  def new
    @content_document = Content::Document.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @content_document }
    end
  end

  # GET /content/documents/1/edit
  def edit
    @content_document = Content::Document.find(params[:id])
  end

  # POST /content/documents
  # POST /content/documents.json
  def create
    @content_document = Content::Document.new(params[:content_document])

    respond_to do |format|
      if @content_document.save
        format.html { redirect_to @content_document, notice: 'Document was successfully created.' }
        format.json { render json: @content_document, status: :created, location: @content_document }
      else
        format.html { render action: "new" }
        format.json { render json: @content_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /content/documents/1
  # PUT /content/documents/1.json
  def update
    @content_document = Content::Document.find(params[:id])

    respond_to do |format|
      if @content_document.update_attributes(params[:content_document])
        format.html { redirect_to @content_document, notice: 'Document was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @content_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content/documents/1
  # DELETE /content/documents/1.json
  def destroy
    @content_document = Content::Document.find(params[:id])
    @content_document.destroy

    respond_to do |format|
      format.html { redirect_to content_documents_url }
      format.json { head :no_content }
    end
  end
end
