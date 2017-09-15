class CommentsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
      @recipe = recipe.find(params[:recipe_id])
      @comment = Comment.new
    end
    def create
      @recipe = recipe.find(params[:recipe_id])
      @comment = @recipe.comments.create!(comment_params.merge(user: current_user))
      redirect_to recipe_comment_path(@comment)
    end
    def edit
      @recipe = recipe.find(params[:recipe_id])
      @comment = Comment.find(params[:id])
      if @comment.user != current_user
      flash[:alert] = "Only the author of the comment can edit"
      redirect_to recipe_comment_path(@comment)
    end
    end
    def update
      @recipe = recipe.find(params[:recipe_id])
      if @comment.user === current_user
        @comment.update(comment_params)
      else
        flash[:alert] = "Only the author of the comment can edit"
      end
      redirect_to recipe_path(@recipe)
    end
    def destroy
      @recipe = recipe.find(params[:recipe_id])
      if @comment.user == current_user
       @comment.destroy
     else
       flash[:alert] = "Only the author of the comment can delete"
     end
     redirect_to recipe_comments
    end
    private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
