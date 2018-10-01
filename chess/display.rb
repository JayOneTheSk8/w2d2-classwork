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
    self.board.grid.each do |row|
      row.each do |piece|
        print piece.name == nil ? " " : piece.name
      end
      puts "\n"
    end
  end

end
