class EventsController < ApplicationController
  # before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find[event_params]
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.owner = current_user
      if @event.save
        redirect_to event_path(@event)
      else
        redirect_to event_new_path(@event), status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event.destroy
    redirect_to index_path, alert: "your event was deleted"
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:event_type, :start, :end, :title, :location, :user_id)
  end

  # def set_event
  #   @event = Event.find(params[:id])
  # end
end
