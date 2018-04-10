class TicketsController < ApplicationController
  def show
    @ticket=Ticket.find(params[:id])
    render json: @ticket
  end

  def new
    @ticket=Ticket.new
  end

  def create
    ticket=Ticket.new(description: params[:description],price:  params[:price],event: params[:event])
    if @ticket.save
      render json: ticket
    end
  end

  def edit
    @ticket=Ticket.find(params[:id])
  end

  def update
    @ticket= Ticket.find(params[:id])
    if @ticket.update_attributes(params[:ticket])
      redirect_to :action=> 'show', :id=>@ticket
    else
      render :action=>'edit'
    end
  end

  def destroy
    @ticket=Ticket.find(params[:id])
    @ticket.destroy
    redirect_to '/tickets/new', :notice=>"Your ticket has been Deleted"
  end
end
