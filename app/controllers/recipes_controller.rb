class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

   def dashboard # fav index
     @recipes = Recipe.all
   end

  end
