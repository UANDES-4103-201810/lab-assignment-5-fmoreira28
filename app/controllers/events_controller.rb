class EventsController < ApplicationController
  def show
    event=Event.find(params[:id])
    render json: event
  end

  def new
    @event=Event.new
  end

  def create
    event=Event.new(name: params[:name],description:  params[:description],start_date:  params[:start_date],place:  params[:place])
    if @event.save
      render json: event
    end
  end

  def edit
    @event=Event.find(params[:id])
  end

  def update
    @event= Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to :action=> 'show', :id=>@event
    end
  end

  def destroy
    @event=Event.find(params[:id])
    @event.destroy
    redirect_to '/events/new', :notice=>"Your event has been Deleted"
  end
end
