# Tablr #

Easy console tables in Ruby

## Examples ##

    # New table
    table = Tablr.new
    
    # We can name our columns initially...
    table.columns ['Column X', 'Column 2', 'Column 3']
    
    # Or we can just add a column on the fly
    (1..20).each do |number|
      table.add_row 'Column 1', "Entry #{number}"
    end
    
    # Just for more filler...
    (1..10).each do
      table.add_row 'Column 2', "Random: #{rand(20)}"
    end
    
    # And let's print!
    table.print

### RESULTS ###

    +----------+------------+----------+----------+
    | Column X | Column 2   | Column 3 | Column 1 |
    +----------+------------+----------+----------+
    |          | Random: 8  |          | Entry 1  |
    |          | Random: 3  |          | Entry 2  |
    |          | Random: 10 |          | Entry 3  |
    |          | Random: 17 |          | Entry 4  |
    |          | Random: 4  |          | Entry 5  |
    |          | Random: 1  |          | Entry 6  |
    |          | Random: 19 |          | Entry 7  |
    |          | Random: 15 |          | Entry 8  |
    |          | Random: 5  |          | Entry 9  |
    |          | Random: 11 |          | Entry 10 |
    |          |            |          | Entry 11 |
    |          |            |          | Entry 12 |
    |          |            |          | Entry 13 |
    |          |            |          | Entry 14 |
    |          |            |          | Entry 15 |
    |          |            |          | Entry 16 |
    |          |            |          | Entry 17 |
    |          |            |          | Entry 18 |
    |          |            |          | Entry 19 |
    |          |            |          | Entry 20 |
    |          |            |          |          |
    +----------+------------+----------+----------+

## TODO ##

* Clean up the code (always)
* A way to delete a row all across columns or a specific column
* Join cells together (Dkubb's Veritas?)
* Quicker way to add rows
* Basic expressions (SUM, AVG, etc).