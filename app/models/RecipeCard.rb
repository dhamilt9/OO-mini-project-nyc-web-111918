class RecipeCard
  attr_reader :user, :recipe, :date, :rating
  @@all = []

  def self.all
    @@all
  end

  def initialize(user, recipe, rating=0, date=Time.now)
    @user = user
    @recipe = recipe
    @date=date
    @rating=rating

    @@all << self
  end
end
