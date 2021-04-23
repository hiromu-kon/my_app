class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy, :show, :profile, :profile_update]
  before_action :is_login?, only: [:new, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def profile
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(create_user_params)
    file = params[:user][:image]
    @user.set_image(file)
    if @user.save
      log_in @user
      flash[:success] = "Welcome! You have signed up successfully."
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    user = User.find_by_email(current_user.email).try(:authenticate, params[:current_password])

    if user && @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      flash.now[:danger] = "Incorrect Current Password" unless user
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def profile_update
    @user = User.find(params[:id])
    if @user.update_attributes(profile_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      flash.now[:danger] = "Failed to update profile."
      render 'profile'
    end
  end

  private
    def create_user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :content)
    end

    def profile_params
      params.require(:user).permit(:name, :image, :content)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url if current_user != @user
    end

end
