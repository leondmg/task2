class ArticlesController < ApplicationController

  before_action :require_signin, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    if current_user
      @articles = Article.all_by_updated_time
    else
      @articles = Article.are_published
    end
  end

  def show
  end

  def edit
  end
    
  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end
    
  def new
    @article = Article.new
  end
    
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end
    
  def destroy
    @article.destroy
    redirect_to articles_url
  end

private

  def set_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).
      permit(:title, :content, :published)
  end
end
