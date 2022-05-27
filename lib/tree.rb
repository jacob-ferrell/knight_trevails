require_relative 'node.rb'

class Tree
  attr_reader :finish, :root
  def initialize(start, finish)
    @root = Node.new(start)
    @finish = finish
    @board = Array.new(8) {Array.new(8) {'_'}}
    @visited = []
    build_tree
  end
  #recursively build a tree where the children of every node is its potential moves, stopping when the end location is reached
  def build_tree(node = @root)
  
    moves = get_moves(node.coord) - @visited
    p moves
    if moves.include?(@finish)
      p "something"
      node.children << Node.new(@finish)
      return
     else
      moves.each  do |move| 
        node.children << Node.new(move) 
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
end