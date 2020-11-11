class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @articles = Article.includes(:user) 
  end

  def new
    @article = Article.new
    @article.images.new
  end

  def create
    Article.create(article_params)
    redirect_to root_path
  end

  def show
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
  end

  def edit
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params)
    redirect_to article_path(article.id)
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to root_path
  end

  def search
    @articles = Article.search(params[:keyword])
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :content, images_attributes: [:src]).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
