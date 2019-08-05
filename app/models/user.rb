class User < ApplicationRecord
  before_create :generate_token


  private 
    def generate_token
      token = SecureRandom.urlsafe_base64
      token = Digest::SHA1.hexdigest(token)
      token = token.to_s
      self.remember_token = token
    end
end
