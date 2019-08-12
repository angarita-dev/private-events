module SessionsHelper
  def sign_in?
    !current_user.nil?
  end
end
