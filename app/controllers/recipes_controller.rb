class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @recipes = Recipe.all
    respond_with(@recipes)
  end

  def show
    respond_with(@recipe)
  end

  def new
    @recipe = Recipe.new
    respond_with(@recipe)
  end

  def edit
  end

  def create
    if current_user.soft_user?
      @user = current_user
      @recipe = @user.recipes.new(recipe_params)
      @recipe.soft_user_token = current_user.soft_user_token
      @recipe.save
      respond_with(@recipe)
    else
      @recipe = Recipe.new(recipe_params)
      @recipe.save
      respond_with(@recipe)
    end
  end

  def update
    @recipe.update(recipe_params)
    respond_with(@recipe)
  end

  def destroy
    @recipe.destroy
    respond_with(@recipe)
  end

  def search
    @results = Recipe.search(params)
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :body, :user_id, :recipe_image)
    end
end
