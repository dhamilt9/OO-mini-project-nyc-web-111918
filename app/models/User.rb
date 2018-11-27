class User
  attr_reader :uname
  @@all = []

  def self.all
    @@all
  end

  def initialize(uname)
    @uname=uname

    @@all << self
  end

  def recipecards
    RecipeCard.all.select {|rc| rc.user==self}
  end

  def recipes
    self.recipecards.map {|u_rc| u_rc.recipe}
  end

  def add_recipe_card(recipe, rating)
    #(user, recipe, rating, date=Time.now)
    RecipeCard.new(self, recipe, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def userallergens
    Allergen.all.select {|allergen| allergen.user==self}
  end

  def allergens
    self.userallergens.map {|allergen| allergen.ingredient}
  end

  def sorted_recipes #_cards
    self.recipecards
    .sort_by{|rc| rc.rating}
    .map{|r| r.recipe}
  end

  def top_three_recipes
    sorted_recipes.reverse[0 .. 2] # .map { |r| r.recipe }
  end

  ### clever max_by usage **DAN** ###
  def most_recent_recipe
    self.recipecards.max_by{|recipecard| recipecard.date}.recipe
  end

  def safe_recipes
    Recipe.all.select {
      |r|
      self.allergens.any? {
        |a|
        # binding.pry
        !(r.ingredients.include?(a))
      }
    }
  end
end
