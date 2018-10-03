require 'colorize'
require_relative 'pieces'
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
        bg_color = set_colors([x, y])
        color_hash = bg_color.merge({color: piece.color})
        piece.to_s.colorize(color_hash)
      end
    end
  end

  def set_colors(picked_pos)
    if self.cursor.cursor_pos == picked_pos && self.cursor.selected
      color = :red
    elsif self.cursor.cursor_pos == picked_pos
      color = :light_yellow
    elsif picked_pos.reduce(:+).even?
      color = :cyan
    else
      color = :blue
    end
    { background: color }
  end

  def run
    until self.cursor.selected
      system('clear')
      render
      self.cursor.get_input
    end
    system('clear')
    render
    # self.cursor.cursor_pos
  end

end
