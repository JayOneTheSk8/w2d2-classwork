class CoffeeError < ArgumentError
  def message
    "I like coffee, but it ain't no fruit"
  end
end

class NoFruitError < ArgumentError
  def message
    "It ain't a fruit and it ain't even coffee!! NO MORE CHANCE FOR YOU!!"
  end
end

class AwkwardPhaseError < ArgumentError
  def self.message
    "I'm sorry but I havent known you for that long..."
  end
end

class NoNameError < ArgumentError
  def self.message
    "You gotta have a name..."
  end
end

class PastimeError < ArgumentError
  def self.message
    "You gotta have a life... that is.. if you're really best friends... dum dum DUM!!"
  end
end
