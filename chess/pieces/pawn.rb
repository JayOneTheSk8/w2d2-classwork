require_relative 'piece'

class Pawn < Piece
  attr_reader :name

  def initialize(colour, board, pos)
    super
    @name = "P"
  end
end
