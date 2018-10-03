require_relative 'piece'

class King < Piece
  attr_reader :name

  def initialize(color, board, pos)
    super
    @name = "K"
  end
end
