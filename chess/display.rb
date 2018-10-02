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
    grid_maker.each { |row| puts row.join }
    "end"
  end

  def grid_maker
    self.board.grid.map.with_index do |row, x|
      row.map.with_index do |piece, y|
        bg_colour = set_colours([x, y])
        piece.name.colorize(bg_colour)
      end
    end
  end

  def set_colours(picked_pos)
    if self.cursor.cursor_pos == picked_pos && self.cursor.selected
      colour = :red
    elsif self.cursor.cursor_pos == picked_pos
      colour = :yellow
    elsif picked_pos.reduce(:+).even?
      colour = :white
    else
      color = :black
    end
    { background: colour }
  end

end
