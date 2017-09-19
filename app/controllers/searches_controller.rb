class SearchesController < ApplicationController
  def results
    @search_term = params[:search]
    @recipes = Search.for(@search_term)
  end

  def add_external_favorite
    @recipe = Recipe.find(params[:id])
    @recipe.favorites.create(user: current_user)
    redirect_to searches_results_path
  end

  def remove_external_favorite
    Favorite.find_by(user: current_user, recipe_id: params[:id]).destroy
    redirect_to searches_results_path
  end

end
