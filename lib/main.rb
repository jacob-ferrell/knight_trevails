require_relative 'node.rb'
require_relative 'tree.rb'

def knight_moves(start, finish)
  Tree.new(start, finish)
end

t = Tree.new([3,3], [4,3])
t.root.children.each { |child| p child.coord}

