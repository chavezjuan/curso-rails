class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
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
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "O artigo foi atualizado com sucesso"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end  
end