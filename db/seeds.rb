# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ingredients = [
["Carrot", "513fceb575b8dbbc210014dd"],
["Peach", "513fceb575b8dbbc210010fb"],
["Kale", "513fceb575b8dbbc2100157f"],
["Blueberries", "513fceb475b8dbbc21000fdf"],
["Strawberry", "513fceb575b8dbbc21001189"],
["Jicama", "513fceb575b8dbbc21001794"],
["Watermelon", "513fceb575b8dbbc210011a0"],
["Ginger", "513fceb575b8dbbc2100156b"],
["Apple", "513fceb475b8dbbc21000f92"],
["Tomato", "513fceb575b8dbbc2100173c"],
["Orange", "513fceb575b8dbbc210010bf"],
["Cucumber", "513fceb575b8dbbc21001553"],
["Pineapple", "513fceb575b8dbbc21001133"],
["Beet", "513fceb575b8dbbc21001485"],
["Celery", "513fceb575b8dbbc210014ff"]
  ]

ingredients.each do |name,item_id|
  Ingredient.create(name: name, item_id: item_id )
end
