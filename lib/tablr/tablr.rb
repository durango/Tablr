class Tablr
  attr_accessor :columns
  
  def initialize(options = {})
    @columns            ||= TablrSpace::OrderedHash.auto
    @row_data           ||= TablrSpace::OrderedHash.new
    options[:separate]  ||= "false"
    options[:headers]   ||= "true"

    @options = options
  end

  # Add columns
  def columns(columns)
    Array(columns).each { |v| @columns[v] = { :length => v.length, :rows => [] } }
  end
  alias_method :column, :columns
  alias_method :add_column, :columns

  # Add rows
  def add_row(column, value)
    add_column(column) unless column_exists?(column) or !column.is_a? String

    Array(value).each do |v|
      @columns[column][:rows].push v
      adjust(column, v.length)
    end
  end

  # Adjust max width for padding
  def adjust(column, length)
    return nil unless column_exists?(column)
    @columns[column][:length] = length if length > @columns[column][:length]
  end

  def print
    str = <<EOL
#{headers}
#{lines}
#{print_rows}#{lines}
EOL
    puts str
  end
  alias_method :exec, :print
  alias_method :display, :print

  protected

  def column_exists?(column)
    @columns.has_key? column
  end

  def lines
    str = '+'
    # Get number of dashes within columns
    @columns.each { |k,v| str << '-' * v[:length] << '--+' }
    str
  end

  def headers
    return '' if @options[:headers] == "false"
    str = lines << "\n"
    @columns.each { |k,v| str << "| #{k}" << " " * str_length(k, v[:length], -1) }
    str << "|"
  end

  def print_rows
    str, array = '', Array.new
    # Store the max lengths of each header quickly
    @columns.each do |k,v|
      array.push v[:length]
    end

    get_rows.each_with_index do |value, i|
      str << "|"
      value.each_with_index do |v, index|
        str << " #{v}" << " " * str_length(v, array[index].to_i, 0) << " |"
      end
      str << "\n"
      str << lines if @options[:separate] == "true"
    end
    str
  end

  def fill_rows
    max_count = 0
    @columns.each_with_index do |v, k|
      max_count = v[1][:rows].length if v[1][:rows].length > max_count
    end
    @columns.each_with_index do |v, k|
      (0..(max_count-v[1][:rows].length)).each do |i|
        add_row v[0], ""
      end
    end
  end

  def get_rows
    count, array = @columns.length-1, Array.new
    fill_rows
    @columns.each_with_index do |value, key|
      value[1][:rows].each_with_index do |v, k|
        array[k] = [] if array[k].nil?
        array[k].insert -1, v
      end
    end
    array
  end

  def str_length(key, length, padding=1)
    (length-(key.length)-padding).abs
  end
end