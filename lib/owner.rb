class Owner

  attr_reader :name, :species
  @@all = []
  # code goes here
  def initialize(name, species="human")
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    return @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.find_all do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.find_all do |dog|
      dog.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.find_all do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.find_all do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    Cat.all.find_all do |cat| 
      cat.mood = "nervous" 
      cat.owner = nil
    end
    Dog.all.find_all do |dog| 
      dog.mood = "nervous" 
      dog.owner = nil
    end
  end

  def list_pets
    Dog.all.count do |dog| 
      Cat.all.count do |cat|
        return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
      end
    end
  end




end