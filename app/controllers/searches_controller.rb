class SearchesController < ApplicationController
  def index #rename send_password_change_notification
    @search_term = params[:search]
    @recipes = Search.for(@search_term)
  end


  def dashboard # fav index
    @recipes = Search.all
  end

  def new
    @recipe = Search.new
  end

  def create
    @recipe = Recipe.create!(recipe_params.merge(user: current_user))
    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

end
