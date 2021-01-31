class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :check_guest]
  before_action :authenticate_user!, except: :show
  before_action :check_guest, only: [:edit, :update]

  def show
    @nickname = @user.nickname
    @articles = @user.articles.order(id: "DESC").page(params[:page]).per(10)
  end

  def edit
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def check_guest
    redirect_to user_path(@user), alert: 'ゲストユーザーは編集できません' if @user.email == "guest@example.com"
  end

end
