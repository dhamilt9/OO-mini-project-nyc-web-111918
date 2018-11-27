class Ingredient
  attr_reader :name

  @@all=[]

  def self.all
    @@all
  end

  def self.most_common_allergen
    @@all.max_by{|i| i.allergicusers.count}
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def ingredientallergens
    Allergen.all.select {|allergen| allergen.ingredient==self}
  end

  def allergicusers
    ingredientallergens.map {|ia| ia.user}
  end


  #TODO: MOST COMMON ALERGEN
end
