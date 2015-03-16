class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index]

  respond_to :html, :js

  def index
    @recipes = Recipe.all
    respond_with(@recipes)
  end

  def show
    @facts = @recipe.calc
    respond_with(@recipe)
  end

  def new
    @ingredients = Ingredient.all
    @recipe = Recipe.new
    respond_with(@recipe)
  end

  def edit
    @ingredients = Ingredient.all
  end

  def create

    @ingredients = Ingredient.all

    if current_user.soft_user?
      @recipe = Recipe.new(recipe_params)
      @recipe.soft_user_token = current_user.soft_user_token
    else
      @user = current_user
      @recipe = @user.recipes.build(recipe_params)
    end

    if params[:ingredients]
    @r_ingredients = Ingredient.find(params[:ingredients])
    else
      @r_ingredients = []
    end

    @recipe.ingredients = @r_ingredients
    @recipe.save
    respond_with(@recipe)
  end

  def update
    @recipe.update(recipe_params)
    respond_with(@recipe)
  end

  def destroy
    @recipe.destroy
    redirect_to root_url
  end

  def search
    @results = Recipe.search(params)
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :body, :user_id, :featured_image)
    end
end
