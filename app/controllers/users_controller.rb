class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user, only: [:index]
  before_action :fetch_user, except: [:index]

  def index
    @users = User.all
  end

  def show
  end

  def edit
    unless current_user.admin? || current_user == @user
      flash[:error] = 'Insufficient access rights.'
      redirect_to root_path
    end
  end

  def update
    if current_user.admin? || current_user == @user
      flash[:error] = 'Insufficient access rights.'
      redirect_to root_path
    end
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

  def authorize_user
    unless user_signed_in? && current_user.admin?
      flash[:error] = 'Insufficient access rights'
      redirect_to root_path
    end
  end
end
