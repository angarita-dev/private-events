class User < ApplicationRecord
  require 'digest'
  before_create :generate_token

  validates :name, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password
  private 
    def generate_token
      token = SecureRandom.urlsafe_base64
      token = Digest::SHA1.hexdigest(token)
      token = token.to_s
      self.remember_token = token
    end
end
