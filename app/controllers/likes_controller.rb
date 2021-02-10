class LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @user = User.find(current_user.id)
    @article = Article.find(params[:article_id])
    @like = current_user.likes.create(article_id: params[:article_id])
  end

  def destroy
    @user = User.find(current_user.id)
    @article = Article.find(params[:article_id])
    @like = Like.find_by(article_id: params[:article_id], user_id: current_user.id)
    @like.destroy
  end

end
