class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(recipe_id: @recipe)
    @recipe.ingredients.build(recipe_id: @recipe)
  end

  def create
    @recipe = Recipe.create(params_hash)
    redirect_to recipe_path(@recipe)
  end

  private

  def params_hash
    params.require(:recipe).permit!
  end
end
