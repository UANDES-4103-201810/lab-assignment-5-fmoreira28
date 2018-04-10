class PlacesController < ApplicationController
  def show
    @place=place.find(params[:id])
  end

  def new
    @place=place.new
    @places=place.find(:all)
  end

  def create
    @place=place.new([:name][:last_name][:email][:password][:address])
    if @place.save
      redirect_to @place
    end
  end

  def edit
    @place=place.find(params[:id])
  end

  def update
    @place= place.find(params[:id])
    if @place.update_attributes(params[:place])
      redirect_to :action=> 'show', :id=>@place
    else
      @place=place.find(:all)
      render :action=>'edit'
    end
  end

  def destroy
    @place=place.find(params[:id])
    @place.destroy
    redirect_to '/places/new', :notice=>"Your place has been Deleted"
  end
end
