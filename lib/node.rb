class Node
  attr_accessor :coord, :children
  def initialize(coord)
    @coord = coord
    @children = []
  end
end