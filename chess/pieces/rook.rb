require_relative 'piece'

class Rook < Piece
  attr_reader :name

  def initialize(color, board, pos)
    super
    @name = "R"
  end
end
