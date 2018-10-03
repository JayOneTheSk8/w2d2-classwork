module Slideable

  def relative_directions
    [[-1, 0], [1, 0], [0, -1], [0, 1]].freeze
    # [up, down, left, right]
  end

  def diagonal_directions
    [[-1, 1], [-1, -1], [1, -1], [1, 1]].freeze
    # [up-forward, up-back, down-back, down-forward]
  end
end
