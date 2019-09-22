require './lib/another-file'

puts

def require_with_extra_bits(path)
  puts "Received path #{path}"
  require path
  puts "Required #{path}"
  yield path
end

require_with_extra_bits('./lib/another-file') do |path| 
  puts "Now I can do what I want with #{path}, mwhahaha!"
end

puts

my_hash = {"a" => "1", "b" => 2, "c" => :three}
my_hash_pairs = my_hash.map{ |key, value| [key, value] }
puts my_hash_pairs.inspect

puts

reborn_hash = Hash[my_hash_pairs]
puts reborn_hash

puts

numbers = (1..16)

batch = []
numbers.each do |num|
  batch << num

  if batch.length == 4
    puts batch.join(' ')
    batch = []
  end
end

puts

numbers.each_slice(4) {|batch| puts batch.join(' ')}

puts

require './lib/tree'

ruby_tree = Tree.new({
  'grandpa' => { 
    'dad' => {
      'child 1' => {}, 
      'child2' => {} 
    },
    'uncle' => {
      'child 3' => {}, 
      'child 4' => {} 
    },
  } 
})

ruby_tree.visit_all do |item| 
  puts "#{item.node_name}: #{item.children.length} children"
end

puts

File.open('./resources/strings.txt').each_line do |line, index|
  if line =~ /Eye/i 
    puts "#{index}: #{line}"
  end
end
