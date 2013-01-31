=begin
Modify the CSV application to support an each method to return a CsvRow object.
Use method_missing on that CsvRow to return the value for the column for a given heading.
=end


module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    attr_accessor :headers, :csv_contents
    def initialize(rows)
      first, *rest = rows
      @headers = first.split(', ')
      @csv_contents = rest.map { |row| row.split(', ') }
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv

  def each(&block)
    @csv_contents.each do |row|
      block.call(CsvRow.new(row, @headers))
    end
  end
end

class CsvRow
  attr_accessor :row, :header
  def initialize(row, header)
    @row = row
    @header = header
  end

  # What should arguments be?
  def method_missing(name, *args)
    puts "Method missing\t\"#{name}\""

    # Find index i of header in header
    i = @header.index(name.to_s)
    # puts "Header\t#{@header.join(',')}"
    # puts "#{name} at index #{i}"

    # Print row[i] for row in contents
    return row[i]
      
  end
end


# lines = [
#   'one, two',
#   'lions, tigers'
# ]
# csv = RubyCsv.new(lines)
# csv.each {|row| puts row.one}

#  http://stackoverflow.com/questions/5739900/ruby-blocks-with-method-missing
#  http://www.alef1.org/ruby/method_missing/