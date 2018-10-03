require_relative 'piece'

class Bishop < Piece
  attr_reader :name

  def initialize(color, board, pos)
    super
    @name = "B"
  end

end
