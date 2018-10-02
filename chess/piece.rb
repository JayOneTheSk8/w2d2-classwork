class Piece
  attr_reader :name

  def initialize(name = 'P')
    @name = name
  end
end

class NullPiece < Piece

  def initialize
    @name = " "
  end
end
