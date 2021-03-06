class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :search, :tag]

  def index
    @articles = Article.includes(:user).order(created_at: "DESC").page(params[:page]).per(10)
  end

  def new
    @article = Article.new
    @article.images.new
  end

  def create
    @article = Article.create(article_params)
    tag_list = params[:article][:tag_ids].split(',')
    if @article.save && tag_list.count < 5
      @article.save_tags(tag_list)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
  end

  def edit
    @tag_list = @article.tag.pluck(:name).join(",")
  end

  def update
    article = Article.find(params[:id])
    tag_list = params[:article][:tag_ids].split(',')
    if article.update(article_params)
      article.save_tags(tag_list)
      redirect_to article_path(article.id)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  def search
    @articles = Article.search(params[:keyword]).order(id: "DESC").page(params[:page]).per(10)
  end

  def tag
    @tag = Tag.find(params[:id])
    @articles = @tag.articles.order(created_at: "DESC").page(params[:page]).per(10)
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :content, images_attributes: [:src]).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
