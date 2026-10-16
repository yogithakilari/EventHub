class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    
    @event = current_user.events.new(event_params)
    
    if @event.save
      redirect_to @event
    else
      render :new , status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit , status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(
      :title,
      :description,
      :venue_name,
      :city,
      :start_time,
      :end_time,
      :status,
      :age_limit,
      :pet_friendly,
      :category_id
    )
  end

end