class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticate_user
   if @current_user == nil
    redirect_to login_url, notice: 'ログインしてください'
   end
  end

  def forbid_login_user
   if @current_user
    redirect_to root_url, notice: 'すでにログインしています'
   end
 end
end
