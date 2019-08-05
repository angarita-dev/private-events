class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    puts params
    if User.create(user_params)
      puts params
      redirect_to root_path
    else
      flash.now[:warning]
    end
  end

  def show
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end
end
