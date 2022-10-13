class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :require_user ,except: [:index,:show]
  before_action :require_same_user
  def index

    @articles=Article.all.paginate(page: params[:page],per_page:5)

  end
  def show
    @article=Article.find(params[:id])
  end
  def new
    @article=Article.new
  end
  def create
    @article=Article.new(article_params)
    @article.user=current_user
    respond_to do |format|
      if @article.save
        format.html { redirect_to articles_path, notice: "Post was successfully created." }

      else
        format.html { render :new, status: :unprocessable_entity }

      end
    end
  end
  def edit
    @article=Article.find(params[:id])
  end
  def update
    @article=Article.find(params[:id])
    @articles=Article.all

    respond_to do |format|
      if @article.update(article_params)
        puts 'success'
        format.html{ redirect_to root_path}
      else
        puts "error message"
      end

    end

  end
  def destroy
    @article=Article.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to articles_path}
    end

  end
  private
  def set_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :body)
  end
  def require_same_user
    unless logged_in?
      redirect_to login_path
    end
  end
end
