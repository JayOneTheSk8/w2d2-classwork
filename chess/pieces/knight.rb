require_relative 'piece'

class Knight < Piece
  attr_reader :name

  def initialize(color, board, pos)
    super
    @name = "k"
  end
end
