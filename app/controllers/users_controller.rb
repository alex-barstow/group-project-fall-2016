class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_user

  def index
    @users = User.all
  end

  def show
  end

  def edit

    # unless current_user == @cheese.user
    #   flash[:error] = "That's not your cheese!."
    #   redirect_to @cheese
    # end
  end

  def update
    @user.assign_attributes(user_params)
    if @user.valid?
      @user.save
      flash[:notice] = 'User Profile updated successfully.'
      redirect_to @user
    else
      errors = fetch_errors
      flash[:error] = errors
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name, :email, :avatar, :avatar_cache)
  end

  def fetch_user
    @user = User.find(params[:id])
  end
end
