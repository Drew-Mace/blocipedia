class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end
  
  def create
    @wiki = Wiki.new(params[:id])
    
    if @wiki.save
      redirect_to @wiki, notice: "Wiki was created."
    else
      flash.now[:alert] = "Error creating Wiki."
      render :new
    end
  end
  
  def new
    @wiki = Wiki.new
  end
  
  def edit 
    @wiki = Wiki.find(params[:id])
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)
    
    if @wiki.save
      flash[:notice] = "Wiki was updated"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end
  
  def show
    @wiki = Wiki.find(params[:id])
  end
  
  def destroy
    @wiki = Wiki.find(params[:id])
    
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the topic."
      render :show
    end
  end
  
  private
  
  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end
end
