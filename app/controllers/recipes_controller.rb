class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index
      @search_term = params[:looking_for] || 'chocolate'
      @recipes = Recipe.all
    end

    def home
      @recipes = Recipe.all
    end

    def new
      @recipe = Recipe.new
    end

    def create
      @recipe = Recipe.create!(recipe_params.merge(user: current_user))
      redirect_to recipe_path(@recipe)
    endzx

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

    private
    def recipe_params
      params.require(:recipe).permit(:title, :description, :img_url)
    end

  end
end
