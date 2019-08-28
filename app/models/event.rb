# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: :User

  has_many :attendances, foreign_key: :attended_event_id, class_name: :Attendance, dependent: :destroy
  has_many :attendees, through: :attendances, source: :user, dependent: :destroy

  validates :title, presence: true
  validates :event_date, presence: true

  scope :previous_events, -> { where('event_date < ?', Date.current) }
  scope :upcomming_events, -> { where('event_date >= ?', Date.current) }
end
