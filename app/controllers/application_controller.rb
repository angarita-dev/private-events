class ApplicationController < ActionController::Base
  include SessionsHelper
  
  def sign_in(user)
    token = generate_token
    user.update_attribute(:remember_token, token)
    cookies.signed.permanent[:remember_token] = token
    set_current_user(user)
  end

  def set_current_user(user)
    @current_user = user
  end

  def sign_out
    @current_user = nil
    cookies.delete :remember_token
  end

 private 
  def generate_token
    token = SecureRandom.urlsafe_base64
    token = Digest::SHA1.hexdigest(token)
    token = token.to_s
  end 
end
