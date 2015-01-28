module ApplicationHelper

  def page_title(title)
    if title.nil?
      "Juice Recipes and Inspiration"
    else
      title
    end
  end

  def explore(topic)
  end

end
