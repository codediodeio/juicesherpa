class PagesController < ApplicationController

  def home
    @token = current_user.soft_user_token
    @user = current_user
    @recipes = Recipe.paginate(:page => params[:page], :per_page => 12).order('created_at DESC')
    @user_recipes = @user.recipes.limit(3)
    @soft_recipes = @recipes.where(soft_user_token: @token)
  end

  def about
  end

end
