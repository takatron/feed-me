# show list of recipes
class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    attr = params.require(:recipe).permit(:title, :ingredients, :steps)
    @recipe = Recipe.new(attr)

    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
