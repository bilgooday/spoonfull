class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index #rename send_password_change_notification
      @search_term = params[:search]
      @recipes = Recipe.for(@search_term)
    end

    def home # rename index
      @recipes = Recipe.all
    end

    def dashboard # fav index
      @recipes = Recipe.all
    end

    def new
      @recipe = Recipe.new
    end

    def create
      @recipe = Recipe.create!(recipe_params.merge(user: current_user))
      redirect_to recipe_path(@recipe)
    end

    def show
      @recipe = Recipe.find(params[:id])
    end


    def edit
      @recipe = Recipe.find(params[:id])
      # if @recipe.user != current_user
      #   flash[:alert] = "Only the author of the post can edit"
      #   redirect_to recipe_path(@recipe)
    end

    def update
      @recipe = Recipe.find(params[:id])
    if @recipe.user === current_user
      @recipe.update(recipe_params)
    else
      flash[:alert] = "Only the author of the post can edit"
    end
      redirect_to recipe_path(@recipe)
    end

    def destroy
      @recipe = Recipe.find(params[:id])
      @recipe.destroy
      redirect_to recipes_path
    end

    # def add_favorite
    #   @recipe = Recipe.find(params[:id])
    #   @recipe.favorites.create(user: current_user)
    #   redirect_to :root
    # end
    #
    # def remove_favorite
    #   Favorite.find_by(user: current_user, recipe_id: params[:id]).destroy
    #   redirect_to :root
    # end

    def add_external_favorite
      @recipe = Recipe.find(params[:id])
      @recipe.favorites.create(user: current_user)
      redirect_to recipes_path(:search => (params[:search]))
    end

    def remove_external_favorite
      @favorite = Favorite.find(params[:id])
      @favorite.destroy
      redirect_to dashboard_recipe_path
    end

    private
    def recipe_params
      params.require(:recipe).permit(:title, :description, :img_url)
    end

  end
