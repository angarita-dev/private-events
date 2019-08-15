class EventsController < ApplicationController
  def index
    @upcomming_events = Event.upcomming_events
    @previous_events = Event.previous_events
  end

  def new
    @event = Event.new()
  end

  def create
    if sign_in?
      event = current_user.created_events.build(event_params)
      if event.save()
        flash[:notice] = "Event created successfully"
        redirect_to current_user
      else 
        flash.now[:warning] = "There has been an error crating your user please try again later"
      end
    else
      flash[:warning] = "Please sign in to create an event"
      redirect_to new_session_path
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    if check_owner(event)
      if event.update(event_params)
        flash[:notice] = "Event updated successfully"
        redirect_to current_user
      else
        flash.now[:warning] = "There has been an error updating your user please try again later"
        redirect_to current_user
      end
    else
      flash[:warning] = "Please sign in to update an event"
      redirect_to new_session_path
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    event = Event.find(params[:id])
    if check_owner(event)
      if event.destroy()
        flash[:notice] = "Event deleted successfully"
        redirect_to current_user
      else
        flash.now[:warning] = "There has been an error deleting your event please try again later"
        redirect_to current_user
      end
    else
      flash[:warning] = "Please sign in to delete an event"
      redirect_to new_session_path
    end
  end

  private
    def event_params
      params.require(:event).permit(:title, :description, :event_date)
    end

    def check_owner(event)
      current_user == event.creator
    end
end
