class Event < ApplicationRecord
  belongs_to :creator, class_name: :User

  has_many :attendances, foreign_key: :attended_event_id, class_name: :Attendance
  has_many :attendees, through: :attendances, source: :user

  scope :previous_events, -> { where('event_date < ?', Date.current) }
  scope :upcomming_events, -> { where('event_date >= ?', Date.current) }
end
