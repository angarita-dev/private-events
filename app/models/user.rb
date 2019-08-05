class User < ApplicationRecord
  require 'digest'
  before_create :generate_token

  validates :name, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password

  has_many :events, foreign_key: "event_id", class_name: "Event"
  has_many :created_events, foreign_key: "author_id", class_name: "Event"

  private 
    def generate_token
      token = SecureRandom.urlsafe_base64
      token = Digest::SHA1.hexdigest(token)
      token = token.to_s
      self.remember_token = token
    end
end
