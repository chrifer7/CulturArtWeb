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
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @content_heritage }
    end
  end

  # GET /content/heritages/1/edit
  def edit
    @content_heritage = Content::Heritage.find(params[:id])
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
end
