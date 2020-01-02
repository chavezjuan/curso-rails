class ArticlesController < ApplicationController
  before_action :set_article, only: [:destroy, :show, :update, :edit]
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end

  def edit
    
  end
  
  def create
    # Outro método para realizar a destinação do artigo
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    #@article.save
    #redirect_to article_path(@article)
    #redirect_to articles_show(@article)

    if @article.save
      flash[:notice] = "O artigo foi criado com sucesso"
      redirect_to article_path(@article)
    else 
      render 'new'
    end
  end

  def update
   
    if @article.update(article_params)
      flash[:notice] = "O artigo foi atualizado com sucesso"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
  
  end

  def destroy
    @article.destroy
    flash[:notice] = "O artigo foi deletado com sucesso."
    redirect_to articles_path
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :description)
    end  
end