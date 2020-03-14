class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticate_user
   if @current_user == nil
    redirect_to login_path, notice: 'ログインしてください'
   end
  end

  def forbid_login_user
   if @current_user
    redirect_to root_path, notice: 'すでにログインしています'
   end
 end

 def ensure_correct_user
   if @current_user.id != params[:id].to_i
    redirect_to root_path, notice: 'このページにはアクセスできません'
   end
 end
end
