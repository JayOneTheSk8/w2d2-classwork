require_relative 'piece'

class Board
  attr_accessor :grid

  def self.start_board
    empty_board = Array.new(8) { Array.new(8, NullPiece.new) }
    empty_board.each_index do |index|
      unless index.between?(2, 5)
        empty_board[index] = Array.new(8, Piece.new)
      end
    end
  end

  def initialize(grid = Board.start_board)
    @grid = grid
  end

  def []=(pos, val)
    row, col = pos
    self.grid[row][col] = val
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def valid_pos?(pos)
    pos.all? { |position| position.between?(0, 7) }
  end

  def move_piece(start_pos, end_pos)
    raise "Move is off of board" unless valid_pos?(start_pos + end_pos)
    if self[start_pos].is_a? NullPiece
      raise "There is no piece in that position"
    end
    unless self[end_pos].is_a? NullPiece
      raise "There is already a piece there"
    end

    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end
end
