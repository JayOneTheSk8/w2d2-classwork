require 'colorize'
require_relative 'piece'
require_relative 'cursor.rb'
require_relative 'board'

class Display
  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    self.board.grid.each_with_index do |row, x|
      row.each_with_index do |piece, y|
        print self.cursor if [x, y] == self.cursor.cursor_pos
        print piece.name == nil ? " " : piece.name.yellow
      end
      puts "\n"
    end
    "End"
  end

end
