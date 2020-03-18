class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:edit]}
  before_action :forbid_login_user, {only: [:new, :create]}
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def show
    @user = User.find(params[:id])
    return Task.where(user_id: params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to root_url, notice: "ようこそ「#{@user.name}」さん" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to @current_user, notice: 'ユーザーを編集しました' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'ユーザーを削除しました' }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
     redirect_to root_url, notice: 'このページにはアクセスできません'
    end
  end
end
