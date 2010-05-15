require 'lib/graph.rb'

def detect_cycle filename
  
  cyclefound = false
  f = open(filename, "r")
  s = f.readline
  number_of_vertices = s.split(' ')[0].to_i
  number_of_edges = s.split(' ')[1].to_i
  #
  @graph.populate(number_of_vertices)
  s = f.readline #burn the empty row
  until f.eof
    s = f.readline
    @graph.add_edge(s)
  end
  @time = 0
  @graph.vertices.each_with_index do |vertex, index|
    unless vertex.visited
      vertex.parent = -1
      dfs_order(index)
    end
  end

  @graph.vertices.each_with_index do |vertex, index|
    vertex.edges.each_with_index do |connected, j|
      if conditions_met(index, connected, cyclefound)
        puts "Cycle found: #{index} #{connected}"
        print_cycle(index, connected)
        cyclefound = true
      end
    end
  end
  puts "No Cycle Found" unless cyclefound
  puts "Time is: #{@time}"
end

def print_cycle index, connected
   p = @graph.vertices[connected].parent
    puts index
    puts connected
    until p == -1
      puts p
      par = p
      p = @graph.vertices[par].parent
    end
end

def conditions_met i, j, cycle
  (@graph.vertices[i].discover_time > @graph.vertices[j].discover_time) && (@graph.vertices[i].finish_time < @graph.vertices[j].finish_time) && !cycle
end

def dfs_order(i)
  @graph.vertices[i].visit
  @time += 1
  @graph.vertices[i].discover_time = @time
  @graph.vertices[i].edges.each_with_index do |connection, j|
    unless @graph.vertices[connection].visited
      @graph.vertices[connection].parent = i
      dfs_order(connection)
    end
  end
  @time += 1
  @graph.vertices[i].finish_time = @time
end





