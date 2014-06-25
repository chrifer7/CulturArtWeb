class Content::OverlayedImgsController < ApplicationController
  # GET /content/overlayed_imgs
  # GET /content/overlayed_imgs.json
  def index
    @content_overlayed_imgs = Content::OverlayedImg.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @content_overlayed_imgs }
    end
  end

  # GET /content/overlayed_imgs/1
  # GET /content/overlayed_imgs/1.json
  def show
    @content_overlayed_img = Content::OverlayedImg.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @content_overlayed_img }
    end
  end

  # GET /content/overlayed_imgs/new
  # GET /content/overlayed_imgs/new.json
  def new
    @content_overlayed_img = Content::OverlayedImg.new

    @heritages = Content::Heritage.all
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @content_overlayed_img }
    end
  end

  # GET /content/overlayed_imgs/1/edit
  def edit
    @content_overlayed_img = Content::OverlayedImg.find(params[:id])
    
    @heritages = Content::Heritage.all
  end

  # POST /content/overlayed_imgs
  # POST /content/overlayed_imgs.json
  def create
    @content_overlayed_img = Content::OverlayedImg.new(params[:content_overlayed_img])
    
    respond_to do |format|
      if @content_overlayed_img.save
        format.html { redirect_to @content_overlayed_img, notice: 'Overlayed img was successfully created.' }
        format.json { render json: @content_overlayed_img, status: :created, location: @content_overlayed_img }
      else
        format.html { render action: "new" }
        format.json { render json: @content_overlayed_img.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /content/overlayed_imgs/1
  # PUT /content/overlayed_imgs/1.json
  def update
    @content_overlayed_img = Content::OverlayedImg.find(params[:id])

    respond_to do |format|
      if @content_overlayed_img.update_attributes(params[:content_overlayed_img])
        format.html { redirect_to @content_overlayed_img, notice: 'Overlayed img was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @content_overlayed_img.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content/overlayed_imgs/1
  # DELETE /content/overlayed_imgs/1.json
  def destroy
    @content_overlayed_img = Content::OverlayedImg.find(params[:id])
    @content_overlayed_img.destroy

    respond_to do |format|
      format.html { redirect_to content_overlayed_imgs_url }
      format.json { head :no_content }
    end
  end
    
  # View para el Json
  def view
    @content_overlayed_img = Content::OverlayedImg.find(params[:id])
    
    render :file => "content/overlayed_imgs/view.json.erb", :content_type => 'application/json', :locals => { :img_sup => @content_overlayed_img }    
  end
end

