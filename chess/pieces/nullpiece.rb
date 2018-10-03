require_relative 'piece'
require 'singleton'

class NullPiece < Piece
  include Singleton
  
  def initialize
    @name = " "
  end
end
