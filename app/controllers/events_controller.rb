class EventsController < ApplicationController
before_action :authenticate_user, only: [:create]

  def index
    @all_events = Event.all
  end

  def new
  end

  def create
    @event = Event.new(
      start_date: params[:start_date],
      duration: params[:duration],
      title: params[:title],
      description: params[:description],
      price: params[:price],
      location: params[:location],
      user_id: current_user.id
    )
    if @event.save
      @event.save
      redirect_to event_path(@event.id)
    else
      render :new
    end
  end

  def show
    @current_event = Event.find(params[:id])
  end


  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_event_path
    end
  end
end
