require 'json'
require 'open-uri'

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

response = open(url).read

JSON.parse(response)["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end
