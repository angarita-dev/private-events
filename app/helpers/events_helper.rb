module EventsHelper
  def check_owner(event)
    current_user == event.creator
  end
end
