require 'lib/vertex.rb'

class Graph
  attr_accessor :vertices
  def initialize
    @vertices = []
  end

  def vertices
    @vertices
  end

  def populate n
    n.times do
      v = Vertex.new
      @vertices << v
    end
  end

  def add_edge s
    st = s.split(' ')
    v = st[0].to_i
    e = st[1].to_i
    @vertices[v].connect(e)
  end
end