# root/recipes
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

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    attr = params.require(:recipe).permit(:title, :ingredients, :steps)
    recipe.update(attr)

    redirect_to recipe_path(recipe)
  end

  def destroy
    id = params[:id]
    Recipe.destroy(id)

    redirect_to recipes_path
  end
end
