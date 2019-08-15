module EventsHelper
  def check_owner(event)
    current_user == event.creator
  end

  def is_attending?(event)
    event.attendees.exists? && !event.attendees.find(current_user.id).nil?
  end
end
