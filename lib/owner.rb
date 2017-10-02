require 'pry'
require_relative 'fish.rb'
require_relative 'cat.rb'
require_relative 'dog.rb'
#'../config/environment.rb'

class Owner
  # code goes here
  @@all = []
  attr_reader :species
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @@all << self
    @species = 'human'
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.length
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    #binding.pry
    self.pets[:fishes] << new_fish
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    #binding.pry
    self.pets[:cats] << new_cat
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    #binding.pry
    self.pets[:dogs] << new_dog
  end

  def walk_dogs
    self.pets[:dogs].each do |dog|
      dog.mood = 'happy'
    end
  end

  def play_with_cats
    self.pets[:cats].each do |cat|
      cat.mood = 'happy'
    end
  end

  def feed_fish
    self.pets[:fishes].each do |fish|
      fish.mood = 'happy'
    end
  end

  def sell_pets
    self.pets[:fishes].each do |fish|
      fish.mood = 'nervous'
    end
    self.pets[:cats].each do |cat|
      cat.mood = 'nervous'
    end
    self.pets[:dogs].each do |dog|
      dog.mood = 'nervous'
    end
    self.pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def list_pets
    fish_count = self.pets[:fishes].length
    dog_count = self.pets[:dogs].length
    cat_count = self.pets[:cats].length
    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end


end

owner = Owner.new("George")

owner.buy_fish("Bubbles")
