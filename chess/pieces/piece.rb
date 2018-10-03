class Piece
  attr_reader :name, :color, :board, :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    " #{name} "
  end

  def empty?
    self.is_a?(NullPiece)
  end
end
