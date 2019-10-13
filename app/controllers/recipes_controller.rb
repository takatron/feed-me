# root/recipes
class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.includes(:categories, :level)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(allowed_params)

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
    recipe.update(allowed_params)

    redirect_to recipe_path(recipe)
  end

  def destroy
    id = params[:id]
    Recipe.destroy(id)

    redirect_to recipes_path
  end

  private
  def allowed_params
    params.require(:recipe).permit(:title, :ingredients, :steps, :level_id, category_ids:[])
  end
end
