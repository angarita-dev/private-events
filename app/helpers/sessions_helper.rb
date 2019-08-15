module SessionsHelper
  def sign_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find_by(remember_token: cookies.signed.permanent[:remember_token])
  end
end
