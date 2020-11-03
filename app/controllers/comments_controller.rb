class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    redirect_to "/articles/#{comment.article.id}"
  end

  def edit
    @comment = Comment.find(params[:id])
    @article = Article.find(@comment.article.id)
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    redirect_to "/articles/#{comment.article.id}"
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to "/articles/#{comment.article.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, article_id: params[:article_id])
  end

end