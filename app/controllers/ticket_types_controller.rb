class TicketTypesController < ApplicationController

  def index
    @ticket_types = TicketType.all
  end

  def show
    @ticket_type = TicketType.find(params[:id])
  end

  def new
    @ticket_type = TicketType.new
    @events = Event.all
  end

  def create
    @ticket_type = TicketType.new(ticket_type_params)
    @events = Event.all

    if @ticket_type.save
      redirect_to @ticket_type
    else
      render :new ,status: :unprocessable_entity
    end
  end

  def edit
    @ticket_type = TicketType.find(params[:id])
    @events = Event.all
  end

  def update
    @ticket_type = TicketType.find(params[:id])
    @events = Event.all

    if @ticket_type.update(ticket_type_params)
      redirect_to @ticket_type
    else
      render :edit , status: :unprocessable_entity
    end
  end

  def destroy
    @ticket_type = TicketType.find(params[:id])
    @ticket_type.destroy

    redirect_to ticket_types_path
  end

  private

  def ticket_type_params
    params.require(:ticket_type).permit(:name, 
                                                              :price,
                                                              :seats,
                                                              :event_id)
  end

end