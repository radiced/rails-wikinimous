class ArticlesController < ApplicationController

before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index # VIEW
    @articles = Article.all
  end

  def show # VIEW
  end

  def new # VIEW
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def edit # VIEW
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def show_me_the_reviews
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  # These are 'strong params', Rails is asking us to 'whitelist'
  # all the params it will accept when assigning params to the
  # fields in a article
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
