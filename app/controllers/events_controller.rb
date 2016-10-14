class EventsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:edit, :update]

  def new
    @event = Event.new
  end

#----------

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event created!"
      redirect_to events_path
    else
      render root_url
    end
  end

#----------

  def edit
    @event = Event.find(params[:id])
  end

#----------

  def show
    @event = Event.find(params[:id])
  end

#----------

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Event updated"
      redirect_to @event
    else
      render 'edit'
    end
  end

#----------

  def index
    @events = Event.paginate(page: params[:page])
  end

#----------    PRIVATE METHODS    ----------

  private

    def event_params
      params.require(:event).permit(:date, :location, :description, :user_id)
    end

#----------

    def correct_user
      @user = Event.find(params[:id]).user
      redirect_to(root_url) unless current_user?(@user)
    end
end
