class Tree
  attr_reader :finish
  initialize(start, finish)
    @root = Node.new(start)
    @finish = finish
    @board = Array.new(8) {Array.new(8)}
  end
  #recursively build a tree where the children of every node is its potential moves
  def build_tree(node = @root)
    return if node.coord == @finish
    get_moves(node.coord).each { |move| node.children << Node.new(move)}
    node.children.each { |child| build_tree(child) }
  end
  #get all potential moves of a given coordinate, excluding moves that would result in going off the board
  def get_moves(coord)
    moves = []
    possible_moves = [1, -1, 2, -2].permutation(2).to_a.reject { |y, x| x.abs == y.abs}
    possible_moves.each do |y, x|
      move = [coord[0] + y, coord[1] + x]
      moves << move if @board[move[0]][move[1]]
    end
  end
end