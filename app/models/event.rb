class Event < ApplicationRecord
  belongs_to :creator, foreign_key: "id", class_name: "User"

  has_many :attendees, foreign_key: "user_id", class_name: "User"
end
