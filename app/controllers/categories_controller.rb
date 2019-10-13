# root/categories
class CategoriesController < ApplicationController
  def index
    @category = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(allowed_params)

    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.update(allowed_params)

    redirect_to category_path(category)
  end

  private
  def allowed_params
    params.require(:category).permit(:name, :colour)
  end
end
