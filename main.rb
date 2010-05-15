require 'lib/hw6.rb'

@graph = Graph.new
filename = ARGV[0]
if filename == '<'
  filename = ARGV[1]
end

detect_cycle(filename)