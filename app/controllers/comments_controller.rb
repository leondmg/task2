class CommentsController < ApplicationController
  before_action :set_article

  def index
      @comments = @article.comments
  end

  def new
      @comment = @article.comments.new
  end

  def create
      @comment = @article.comments.new(comment_params)
  
      if @comment.save
        redirect_to article_comments_url(@article),
          notice: "Success!"
      else
        render :new
      end
  end

private

  def comment_params
      params.require(:comment).
          permit(:name, :content)
  end

  def set_article
      @article = Article.find(params[:article_id])
  end
end
