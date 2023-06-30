class EventsController < ApplicationController
  before_action :set_event, only: [:destroy]

  def index
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date
    @events = Event.where(start: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    @event = Event.new
    @event_notifications = current_user.event_invited_users.order(created_at: :desc).limit(5)
    @recent_events_count = Event.where('created_at > ?', 48.hours.ago).count
  end

  def show
    @event = Event.find(params[:id])
    # only call strong params when creating and updating
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save!
      redirect_to events_path, alert: "your event was created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to events_path
  end

  def destroy
    @event.destroy
    redirect_to events_path, alert: "your event was deleted"
  end

  private

  def event_params
    params.require(:event).permit(:id, :event_type, :start, :end, :title, :location, :user_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
