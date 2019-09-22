class Tree
  attr_accessor :children, :node_name

  def initialize(data)
    names = data.keys

    if names.length != 1
      raise Exception, 'Invalid tree provided - multiple root nodes found'
    end

    @node_name = names[0]
    @children = []
    
    if data[self.node_name].length > 0
      @children = data[self.node_name].map do |name, children| 
        child = {name => children}
        Tree.new child
      end
    end
  end
  
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  
  def visit(&block)
    block.call self
  end
end
