class Tree
  attr_reader :paths
  def initialize(start, finish)
    @root = Node.new(start)
    @finish = finish
    @visited = []
    @paths = []
    build_tree
  end
  #recursively build a tree where the children of every node is its potential moves, unless the end coordinate is in the potential moves
  def build_tree(node = @root)
    moves = get_moves(node.coord) - @visited
    if moves.include?(@finish)
      build_path(Node.new(@finish, node))
     else
      moves.each  do |move| 
        node.children << Node.new(move, node) 
        @visited << move
      end
      node.children.each { |child| build_tree(child) } 
    end
  end
  #get all potential moves of a given coordinate, excluding moves that would result in going off the board
  def get_moves(coord)
    moves = []
    possible_moves = [1, -1, 2, -2].permutation(2).to_a.reject { |y, x| y.abs == x.abs}
    possible_moves.each do |y, x|
      move = [coord[0] + y, coord[1] + x]
      next if move.reject { |e| (0..7).include?(e) }.any?
      moves << move 
    end
    moves
  end
  #build the path from the given node to the root node and add it to @paths
  def build_path(node, path = [])
    return @paths << path unless node
    path.unshift(node.coord)
    build_path(node.parent, path)
  end
end