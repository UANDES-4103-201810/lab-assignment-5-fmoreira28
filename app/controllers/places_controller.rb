class PlacesController < ApplicationController
  def show
    place=Place.find(params[:id])
    render json: place
  end

  def new
    @place=Place.new
  end

  def create
    place=Place.new(name: params[:name],address:  params[:address],capacity:  params[:capacity])
    if @place.save
      render json: place
    end
  end

  def edit
    @place=Place.find(params[:id])
  end

  def update
    @place= Place.find(params[:id])
    if @place.update_attributes(params[:place])
      redirect_to :action=> 'show', :id=>@place
    else
      render :action=>'edit'
    end
  end

  def destroy
    @place=Place.find(params[:id])
    @place.destroy
    redirect_to '/places/new', :notice=>"Your place has been Deleted"
  end
end
