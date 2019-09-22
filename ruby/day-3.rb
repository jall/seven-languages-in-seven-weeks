require './lib/acts-as-csv.rb'

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCsv.new
csv.each do |row|
  puts row.one
  puts row.two
end
