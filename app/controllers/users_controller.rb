class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  before_action :move_to_root

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

  def move_to_root
    redirect_to root_path unless user_signed_in?
  end

end
