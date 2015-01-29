module ApplicationHelper

  def page_title(title)
    if title.nil?
      "Juice Recipes and Inspiration"
    else
      title
    end
  end

  def authorize_user(recipe)
      recipe.user == current_user
  end


end
