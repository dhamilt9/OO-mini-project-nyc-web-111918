require_relative '../config/environment.rb'

r1 = Recipe.new("Strawberry Rhubarb Pie")
r2 = Recipe.new("Apple Pie")
r3 = Recipe.new("Bacon Wrapped Scallops")
r4 = Recipe.new("Chicken Gizzard Stew")
u1 = User.new("Dan")
i1 = Ingredient.new("Strawberry")
i2 = Ingredient.new("Flour")
                  # user, ingredient
# a1 = Allergen.new(u1, i1)
                    # user, recipe
#rc1 = RecipeCard.new(u1, r1)

u1.add_recipe_card(r1, 5)
u1.add_recipe_card(r2, 5)
u1.add_recipe_card(r3, 4)
u1.add_recipe_card(r4, 0.5)
u1.declare_allergen(i1)

r1.add_ingredients([i1,i2])
                        #ingredient, recipe
# ri1 =  RecipeIngredient.new(r1, i1)
# ri2 = RecipeIngredient.new(r1, i2)
#
# u1.add_recipe_card(r1)

binding.pry
