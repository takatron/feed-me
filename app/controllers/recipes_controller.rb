# root/recipes
class RecipesController < ApplicationController
  require 'pry'
  def index
    @recipes = Recipe.all.includes(:categories)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    binding.pry
    attr = params.require(:recipe).permit(:title, :ingredients, :steps, :level_id, category_ids:[])
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
    binding.pry
    attr = params.require(:recipe).permit(:title, :ingredients, :steps, :level_id, category_ids:[])
    recipe.update(attr)

    redirect_to recipe_path(recipe)
  end

  def destroy
    id = params[:id]
    Recipe.destroy(id)

    redirect_to recipes_path
  end
end
