module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
    base.include Enumerable
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods   
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(',').map(&:chomp)

      file.each do |row|
        contents = row.chomp.split(',').map(&:chomp)
        row = CsvRow.new(self.headers, contents)
        @csv_contents << row
      end
    end

    attr_accessor :headers, :csv_contents, :position
    def initialize
      read 
      @position = 1 # Skip the header row
    end

    def each
      @csv_contents.each {|row| yield row}
    end
  end
end

class CsvRow
  attr_accessor :data

  def initialize(headers, contents)
    if headers.length != contents.length
      raise Exception, 'CsvRow headers and contents must be the same length'
    end

    @data = Hash[headers.zip(contents)]
  end

  def method_missing(method_name, *args)
    header = method_name.to_s
    value = @data[header]
    if value.nil?
      return super
    end
    value
  end
end
