class PagesController < ApplicationController

  def home
    @user = current_user
    @recipes = Recipe.paginate(:page => params[:page], :per_page => 12)
    @user_recipes = @user.recipes.limit(3)
  end

  def about
  end

end
