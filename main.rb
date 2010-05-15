require 'lib/hw6.rb'


@cyclefound = false
@graph = Graph.new
filename = ARGV[0]
if filename == '<'
  filename = ARGV[1]
end

detect_cycle(filename)