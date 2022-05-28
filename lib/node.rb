class Node
  attr_accessor :coord, :children, :parent

  def initialize(coord, parent = nil)
    @parent = parent
    @coord = coord
    @children = []
  end
end
