class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if !user.nil? && user == user.authenticate(params[:user][:password_digest])
      sign_in(user)
      flash[:notice] = "You have logged in correctly"
      redirect_to root_path
    else
      flash[:warning] = "Wrong combination of email/password"
      redirect_to new_session_path
    end
  end

  def destroy
    sign_out
    flash[:notice] = "You have logged out correctly"
    redirect_to root_path
  end
end
