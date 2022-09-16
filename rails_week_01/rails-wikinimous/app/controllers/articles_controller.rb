class ArticlesController < ApplicationController
  before_action :get_article
  skip_before_action :get_article, only: [:index, :new, :create]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path(@article)
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to articles_path
  end

  def destroy
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :image_url)
  end

  def get_article
    @article = Article.find(params[:id])
  end
end
