require_relative 'node'
require_relative 'tree'

def knight_moves(start, finish)
  t = Tree.new(start, finish)
  shortest_path = t.paths.sort { |a, b| a.length - b.length }.first
  puts "You made it in #{shortest_path.length - 1} moves!  Here's your path:"
  shortest_path.each { |coord| p coord }
end

knight_moves([3, 3], [7, 7])
