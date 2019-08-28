# frozen_string_literal: true

module EventsHelper
  def check_owner(event)
    current_user == event.creator
  end

  def attending?(event)
    event.attendees.exists? && !current_user.nil? && !event.attendees.find(current_user.id).nil?
  end
end
