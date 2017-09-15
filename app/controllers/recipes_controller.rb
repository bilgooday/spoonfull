class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index
      @recipes = recipe.all
    end

    def new
      @recipe = recipe.new
    end

    def create
      @recipe = recipe.create!(recipe_params.merge(user: current_user))
      redirect_to recipe_path(@recipe)
    end

    def show
      @recipe = recipe.find(params[:id])
    end


    def edit
      @recipe = recipe.find(params[:id])
      # if @recipe.user != current_user
      #   flash[:alert] = "Only the author of the post can edit"
      #   redirect_to recipe_path(@recipe)
    end

    def update
      @recipe = recipe.find(params[:id])
    if @recipe.user === current_user
      @recipe.update(recipe_params)
    else
      flash[:alert] = "Only the author of the post can edit"
    end
      redirect_to recipe_path(@recipe)
    end

    def destroy
      @recipe = recipe.find(params[:id])
      @recipe.destroy
      redirect_to recipes_path
    end

    private
    def recipe_params
      params.require(:recipe).permit(:title, :description, :img_url)
    end

  end
