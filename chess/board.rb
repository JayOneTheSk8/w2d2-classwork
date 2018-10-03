require_relative 'pieces'

class Board
  attr_accessor :grid

  def self.start_board
    empty_board = Array.new(8) { Array.new(8, NullPiece.new) }
  end

  def initialize(grid = Board.start_board)
    @grid = grid
    populate if grid.all? do |row|
      row.all? { |piece| piece.is_a?(NullPiece) }
    end
  end

  def populate
    self.grid.each_with_index do |row, row_num|
      case row_num
      when 0
        set_castle_row(row, :black, row_num)
      when 1
        set_pawns(row, :black, row_num)
      when 6
        set_pawns(row, :white, row_num)
      when 7
        set_castle_row(row, :white, row_num)
      else
        next
      end
    end
  end

  def set_castle_row(row, color, row_num)
    row.each_index do |pos|
      case pos
      when 0, 7
        self[[row_num, pos]] = Rook.new(color, self, [row_num, pos])
      when 1, 6
        self[[row_num, pos]] = Knight.new(color, self, [row_num, pos])
      when 2, 5
        self[[row_num, pos]] = Bishop.new(color, self, [row_num, pos])
      when 3
        self[[row_num, pos]] = Queen.new(color, self, [row_num, pos])
      when 4
        self[[row_num, pos]] = King.new(color, self, [row_num, pos])
      end
    end
  end

  def set_pawns(row, color, row_num)
    row.each_index { |pos| self[[row_num, pos]] = Pawn.new(color, self, [row_num, pos]) }
  end

  def []=(pos, val)
    row, col = pos
    self.grid[row][col] = val
  end

  def [](pos)
    row, col = pos
    self.grid[row][col]
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
