class ScrappersController < ApplicationController
  # GET /scrappers
  # GET /scrappers.xml
  def index
    @scrappers = Scrapper.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @scrappers }
    end
  end

  # GET /scrappers/1
  # GET /scrappers/1.xml
  def show
    @scrapper = Scrapper.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @scrapper }
    end
  end

  # GET /scrappers/new
  # GET /scrappers/new.xml
  def new
    @scrapper = Scrapper.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @scrapper }
    end
  end

  # GET /scrappers/1/edit
  def edit
    @scrapper = Scrapper.find(params[:id])
  end

  # POST /scrappers
  # POST /scrappers.xml
  def create
    @scrapper = Scrapper.new(params[:scrapper])

    respond_to do |format|
      if @scrapper.save
        format.html { redirect_to(@scrapper, :notice => 'Scrapper was successfully created.') }
        format.xml  { render :xml => @scrapper, :status => :created, :location => @scrapper }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @scrapper.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /scrappers/1
  # PUT /scrappers/1.xml
  def update
    @scrapper = Scrapper.find(params[:id])

    respond_to do |format|
      if @scrapper.update_attributes(params[:scrapper])
        format.html { redirect_to(@scrapper, :notice => 'Scrapper was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @scrapper.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /scrappers/1
  # DELETE /scrappers/1.xml
  def destroy
    @scrapper = Scrapper.find(params[:id])
    @scrapper.destroy

    respond_to do |format|
      format.html { redirect_to(scrappers_url) }
      format.xml  { head :ok }
    end
  end
end
