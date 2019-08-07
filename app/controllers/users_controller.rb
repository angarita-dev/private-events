class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    user = User.new(user_params)
    if user.save()
      sign_in(user)
      flash[:notice] = "User created succesfully"
      redirect_to root_path
    else
      flash.now[:warning] = "There has been an error crating your user please try again later"
    end
  end

  def show
    user = User.find(params[:id])
    @events = Event.where(creator: user)
  end

  private
    def user_params
      params.require(:user).permit(:name,:password,:password_confirmation)
    end
end
