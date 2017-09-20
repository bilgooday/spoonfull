class SearchesController < ApplicationController
  def home #rename send_password_change_notification
    @search_term = params[:search]
    @recipes = Recipe.for(@search_term)
  end

  def results #rename send_password_change_notification
    @search_term = params[:search]
    @recipes = Recipe.for(@search_term)
  end

  def add_external_favorite
     @recipe = Recipe.find(params[:id])
     @recipe.favorites.create(user: current_user)
    #  redirect_to searches_results_path(:search => (params[:search]))
   end

   def remove_external_favorite
     @favorite = Favorite.find(params[:id])
     @favorite.destroy
     redirect_to dashboard_recipe_path
   end

end
