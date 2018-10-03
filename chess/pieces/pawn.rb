require_relative 'piece'

class Pawn < Piece
  attr_reader :name

  def initialize(color, board, pos)
    super
    @name = "P"
  end
end
