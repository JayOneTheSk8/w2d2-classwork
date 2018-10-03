require_relative 'piece'

class Queen < Piece
  attr_reader :name

  def initialize(colour, board, pos)
    super
    @name = "Q"
  end
end
