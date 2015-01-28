class PagesController < ApplicationController

  def home
    @recipes = Recipe.all.order("created_at DESC")
  end

  def about
  end

end
