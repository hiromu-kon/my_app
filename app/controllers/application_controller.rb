class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :set_search

  def set_search
    @search = Room.ransack(params[:q])
    @search_rooms = @search.result
  end

  def authenticate_user
    if session[:user_id] == nil
      flash[:danger] = "ログインが必要です"
      redirect_to "/login"
    end
  end

  def is_login?
    if current_user
      flash[:danger] = "すでにログインしています"
      redirect_to root_path
    end
  end

end
