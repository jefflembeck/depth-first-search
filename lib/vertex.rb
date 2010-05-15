class Vertex
  attr_accessor :edges, :visited, :parent, :discover_time, :finish_time
  def initialize
    @edges = []
    @visited = false
    @parent = 0
    @discover_time = 0
    @finish_time = 0
  end
  
  def visit
    @visited = true
  end

  def connect e
    @edges << e
  end
end