class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js

  def index
    @ingredients = Ingredient.all
    respond_with(@ingredients)
  end

  def show
    @facts = @ingredient.get_item(@ingredient.item_id)
    respond_with(@ingredient)
  end

  def new
    @ingredient = Ingredient.new
    @results = @ingredient.filtered_search(params)
    respond_with(@ingredient)
  end

  def edit
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
    respond_with(@ingredient)
  end

  def update
    @ingredient.update(ingredient_params)
    respond_with(@ingredient)
  end

  def destroy
    @ingredient.destroy
    respond_with(@ingredient)
  end

  private
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
      params.require(:ingredient).permit(:name, :body, :item_id)
    end
end
