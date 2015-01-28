class Recipe < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :ingredients

  validates :name, presence: true, length: {minimum: 2, maximum: 30}



  # Search Method

  def self.search(params)
    #where("name ILIKE ?", "%#{params[:keyword]}%") ||
    where("name ILIKE ? OR body ILIKE ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
  end



  # Method to return type of user, soft or full
  def type_of_user
    if self.user_id.present?
       username = self.user.email.split("@")[0]
       "#{username}-#{self.user.id}"
     else
       "Guest"
    end
  end

  # Nutrition Calculations

  def calc
    @facts = []
    self.ingredients.each do |i|
      x = i.get_item(i.item_id)
      @facts << x
    end
    @facts
  end

  # Total Calories

  def calc_calories
    array = []
      @facts.each do |fact|
        x = fact["nf_calories"]
        array << x
      end
    array.inject(:+)
  end

  # Calories from Fat

  def calc_cal_fat
    array = []
    @facts.each do |fact|
      x = fact["nf_calories_from_fat"]
      array << x
    end
    array.inject(:+)
  end

  # Total Fat

  def calc_total_fat
    array = []
    @facts.each do |fact|
      x = fact["nf_total_fat"]
      array << x
    end
    array.inject(:+)
  end

  # Fat %

  def calc_fat_dv
    array = []
    @facts.each do |fact|
      x = (fact["nf_total_fat"] /65)*100 # 65 is USDA recommended daily fat
      array << x
    end
    array.inject(:+)
  end

  # Saturated Fat

  def calc_sat_fat
    array = []
    @facts.each do |fact|
      x = fact["nf_saturated_fat"]
      array << x
    end
    array.inject(:+)
  end


  # Polyunsaturated Fat

  def calc_poly_fat
    array = []
    @facts.each do |fact|
      x = fact["nf_polyunsaturated_fat"]
      array << x
    end
    array.inject(:+)
  end

  # Choleseterol

  def calc_cholesterol
    array = []
    @facts.each do |fact|
      x = fact["nf_cholesterol"]
      array << x
    end
    array.inject(:+)
  end

  # Choleseterol %

  def calc_cholesterol_dv
    array = []
    @facts.each do |fact|
      x = (fact["nf_cholesterol"] /300)*100 # 300 is USDA daily cholesterol
      array << x
    end
    array.inject(:+)
  end


  # Sodium

  def calc_sodium
    array = []
    @facts.each do |fact|
      x = fact["nf_sodium"]
      array << x
    end
    array.inject(:+)
  end

  # Sodium %

  def calc_sodium_dv
    array = []
    @facts.each do |fact|
      x = (fact["nf_sodium"] /2400)*100
      array << x
    end
    array.inject(:+)
  end

  # Total Carbs

  def calc_carbs
    array = []
    @facts.each do |fact|
      x = fact["nf_total_carbohydrate"]
      array << x
    end
    array.inject(:+)
  end

  # Dietary Fiber

  def calc_fiber
    array = []
    @facts.each do |fact|
      x = fact["nf_dietary_fiber"]
      array << x
    end
    array.inject(:+)
  end

  # Sugars

  def calc_sugar
    array = []
    @facts.each do |fact|
      x = fact["nf_sugars"]
      array << x
    end
    array.inject(:+)
  end

  # Protein

  def calc_protein
    array = []
    @facts.each do |fact|
      x = fact["nf_protein"]
      array << x
    end
    array.inject(:+)
  end

  # Vitamin A

  def calc_a
    array = []
    @facts.each do |fact|
      x = fact["nf_vitamin_a_dv"]
      array << x
    end
    array.inject(:+)
  end

  # Vitamin C

  def calc_c
    array = []
    @facts.each do |fact|
      x = fact["nf_vitamin_c_dv"]
      array << x
    end
    array.inject(:+)
  end

# Calcium

def calc_calcium
  array = []
  @facts.each do |fact|
    x = fact["nf_calcium_dv"]
    array << x
  end
  array.inject(:+)
end

# Iron

def calc_iron
  array = []
  @facts.each do |fact|
    x = fact["nf_iron_dv"]
    array << x
  end
  array.inject(:+)
end

end
