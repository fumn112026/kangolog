class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @articles = user.articles.order(id: "DESC").page(params[:page]).per(10)
  end

end
