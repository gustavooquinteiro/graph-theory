class Graph
    attr_reader :adjacents
    
    def initialize(vertices)
        @vertices = vertices
        @adjacents = []
        (0..@vertices-1).each do |i|
            @adjacents[i] = []
        end
    end
    
    def add_edge(vertex, other_vertex)
        @adjacents[vertex] << other_vertex
    end
    
    def is_cyclic_util(node, visited, rec_stack)
        visited[node] = true
        rec_stack[node] = true
        for neighbour in @adjacents[node]
            if !visited[neighbour] 
                if is_cyclic_util(neighbour, visited, rec_stack)
                    return true
                end
            elsif rec_stack[neighbour]
                return true
            end
        end
        rec_stack[node] = false
        return false
    end
    
    
    def is_cyclic()
        visited = [false] * @vertices
        rec_stack = [false] * @vertices
        for node in 0..@vertices-1
            if !visited[node]
                if is_cyclic_util(node, visited, rec_stack)
                    return true
                end
            end
        end
        return false
    end
end
def main()

    # adding a directed graph example that hasnt a cycle
    g=Graph.new(4)
    g.add_edge(0, 1) 
    g.add_edge(0, 2) 
    g.add_edge(1, 2) 
    g.add_edge(2, 3) 
       
    if g.is_cyclic()
        puts "Graph g has a cycle"
    else
        puts "Graph g has no cycle"
    end
    
    # adding a directed graph example that has a cycle
    f=Graph.new(2)
    f.add_edge(0, 1)
    f.add_edge(1, 0)
    
    if f.is_cyclic()
        puts "Graph f has a cycle"
    else
        puts "Graph f has no cycle"
    end
end

main
