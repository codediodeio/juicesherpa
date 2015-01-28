module RecipesHelper

  # Gets ingredient image. If none exists, displays default.

  def get_image(name)
    path = "#{Rails.root}/app/assets/images/#{name}.svg"

    if File.exist?(path)
      "#{name}.svg"

    else
      "default.svg"
    end

  end

end
