class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new # get
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create # post
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created." # Aggiunge un messaggio flash per confermare la creazione
      redirect_to @article # Reindirizza alla pagina del nuovo articolo appena creato
    else
      render "new", status: :unprocessable_entity # Se c'è un errore, ricarica il form (con gli errori salvati)
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated." # Aggiunge un messaggio flash per confermare l'aggiornamento
      redirect_to @article # Reindirizza alla pagina del articolo aggiornato
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was successfully deleted." # Aggiunge un messaggio flash per confermare la cancellazione
    redirect_to articles_path # Reindirizza alla lista degli articoli dopo la cancellazione
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
