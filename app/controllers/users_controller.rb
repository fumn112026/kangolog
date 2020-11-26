class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @articles = user.articles.order(id: "DESC").page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :image)
  end
end
