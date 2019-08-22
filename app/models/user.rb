class User < ApplicationRecord
  require 'digest'
  before_create :generate_token

  validates :name, uniqueness: true, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password

  has_many :created_events, foreign_key: :creator_id, class_name: :Event, dependent: :destroy
 
  has_many :attendances, foreign_key: :event_attendee_id, class_name: :Attendance
  has_many :attended_events, through: :attendances, source: :event
  
  private 
  def generate_token
    token = SecureRandom.urlsafe_base64
    token = Digest::SHA1.hexdigest(token)
    token = token.to_s
    self.remember_token = token
  end
end
