class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  validates :item_id, presence: true

  require "nutritionix/api_1_1"
  # include ActiveModel::Serializers::JSON

  # serialize :body


  def get_nutrition_facts(query)

    app_id = Figaro.env.nutritionix_app_id
    app_key = Figaro.env.nutritionix_app_key

    provider = Nutritionix::Api_1_1.new(app_id, app_key)
    search_params = {
      offset: 0,
      limit: 10,
      fields: ['item_id', 'item_description', 'item_name', 'nf_calories'],
      filters: {
        item_type: 3 #filters results for only USDA listing
      },
      query: query
    }
    results_json = provider.nxql_search(search_params)
    JSON.parse(results_json)
  end

  def search(params)
    hash = get_nutrition_facts(params[:keyword]) # Get the full hash
    if hash.key?("hits")
       hash.fetch("hits") # Fetch Hits
    end
  end

  def get_item(id)

    app_id = Figaro.env.nutritionix_app_id
    app_key = Figaro.env.nutritionix_app_key

    provider = Nutritionix::Api_1_1.new(app_id, app_key)

    results_json = provider.get_item(id)
    results_hash = JSON.parse(results_json)
    results_hash
  end


end
