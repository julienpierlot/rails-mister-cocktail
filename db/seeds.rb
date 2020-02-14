require 'json'
require 'open-uri'


puts "creating ingredients..."
url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
response = open(url).read
JSON.parse(response)["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end

puts "creating cocktails..."
Cocktail.create!(name: "Mojito")

puts "creating dose"
Dose.create!(ingredient: Ingredient.find_by(name: 'Dark rum'), cocktail: Cocktail.last, description: "6cl")

puts "done"
