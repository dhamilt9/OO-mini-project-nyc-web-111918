class Recipe
  attr_reader :name
  @@all = []

  def self.all
    @@all
  end
  def self.most_popular
    @@all.max_by { |recipe| recipe.users.count }
  end

  def initialize(name)
    @name=name
    @@all << self
  end

  def recipecards
    RecipeCard.all.select {|rc| rc.recipe==self}
  end

  def users
    self.recipecards.map {|rc| rc.user}
  end

  def recipeingredients
    RecipeIngredient.all.select { |ri| ri.recipe == self }
  end

  def ingredients
    self.recipeingredients.map { |ri| ri.ingredient }
  end

  ## ************* super clever ******** ##
  def allergens
    allergen_ingredients = Allergen.all.map { |a| a.ingredient  }
    self.ingredients.select {
      |i|
      allergen_ingredients.include?(i)
    }
  end

  def add_ingredients (ingredients)
    ingredients.each {|i| RecipeIngredient.new(self, i) }
  end
end
