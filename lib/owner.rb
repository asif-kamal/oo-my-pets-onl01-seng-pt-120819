require 'pry'
class Owner
  
  OWNERS = []
  
  
  attr_reader :name, :species
  
  

  def initialize(name)
    OWNERS << self
    @species = "human"
    @name = name
  end
  
  def say_species
    puts "I am a #{species}."
    "I am a #{species}."
  end
  
  def self.all 
    OWNERS
  end
  
  def self.count
    OWNERS.size
  end
  
  def self.reset_all
    OWNERS.clear
  end
  
  def cats 
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs 
    Dog.all.select{|dog| dog.owner == self}
  end


  def buy_dog(name)
    @pets << Dog.new(name, self)
  end

  def buy_cat(name)
    @pets << Cat.new(name, self)
  end

  def walk_dogs
    self.dogs.map{|dog| 
    dog.mood = "happy"}
  end

  def feed_cats
    self.cats.map {|cat|
      cat.mood = "happy"}
    end
  


 def sell_pets
   #binding.pry
    all_pets = self.dogs + self.cats
    all_pets.map do |animal|
        animal.mood = "nervous"
        animal.owner = nil
      end
    end
  

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end


end
 