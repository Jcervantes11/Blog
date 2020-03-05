class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:show,:index]
  before_action :set_article, except: [:index, :new, :create]
  # Get /articles
  def index
  	# Todos los registros
  	@articles = Article.all
  end
  # Get /articles/:id
  def show
    @article.update_visits_count
  end
  # Get /articles/new
  def new
  	@article = Article.new
  end

  def edit
  
  end

  # Post /articles
  def create
  		# insert into
  	@article = current_user.articles.new(article_params)

  	if @article.save
  		redirect_to @article 
  	else
  		render :new
  	end
  end

  def destroy
  	# delete from articles
  	
  	@article.destroy # destroy elimina el objeto de la base de datos
  	redirect_to articles_path  
  end

  def update
  	# update
  	# @article.update_attributes({titulo: 'nuevo titulo'})
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  	
  private
  
  def set_article
    @article = Article.find(params[:id])
  end

  def validate_user
    redirect_to new_user_session_path, notice: "Es necesario iniciar sesión"
  end

  def article_params
  	params.require(:article).permit(:title,:body)	
  end

end