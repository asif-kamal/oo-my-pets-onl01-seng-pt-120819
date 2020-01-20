require 'pry'
class Owner
  
  OWNERS = []
  
  attr_accessor :pets
  attr_reader :name, :species
  

  def initialize(name)
    OWNERS << self
    @species = "human"
    @name = name
    @pets = {:dogs => [], :cats => []}
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
    pets[:dogs] << Dog.new(name, self)
  end

  def buy_cat(name)
    pets[:cats] << Cat.new(name, self)
  end

  def walk_dogs
    pets[:dogs].each{|dog| 
    dog.mood = "happy"}
    
  end

  def feed_cats
    pets[:cats].map do |cat|
      cat.mood = "happy"
    end
  end


 def sell_pets
    pets.each do |species, animals|
      animals.map do |animal|
        animal.mood = "nervous"
      end
      animals.clear
    end
  end

  def list_pets
    "I have #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end


end
 