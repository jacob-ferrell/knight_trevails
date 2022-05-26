class Node
  attr_accessor :coord, :children
  initialize(coord)
    @coord = coord
    @children = []
  end
end