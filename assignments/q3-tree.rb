class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    
    @node_name = name.keys[0]
    @children = children

    name[@node_name].each do |key, val|
      # puts "#{key}, #{val}"
      # puts "#{val} is #{val.class}"
      children.push(Tree.new({key => val})) unless val.empty?
    end

    # puts "name: #{node_name} -> children: #{children}"
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

# tree = Tree.new({
#   'grandpa' => {
#     'dad' => {
#       'child 1' => {},
#       'child 2' => {}
#     },
#     'uncle' => {
#       'child 3' => {}, 
#       'child 4' => {}
#     }
#   }
# })

# puts "Visit single node"
# puts tree.visit{|node| puts node.node_name}

# puts "visit tree"
# tree.visit_all {|node| puts node.node_name}