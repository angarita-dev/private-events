class Event < ApplicationRecord
  belongs_to :creator, class_name: :User

  has_many :attendances, foreign_key: :event_id
  has_many :attendees, through: :attendances,
                       source: :user,
                       foreign_key: :event_id , 
                       class_name: :User

  scope :previous_events, -> { where('event_date < ?', Date.current) }
  scope :upcomming_events, -> { where('event_date >= ?', Date.current) }
end
