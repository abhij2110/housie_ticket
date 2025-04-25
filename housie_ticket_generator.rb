def generate_housie_ticket
  # Each column in the ticket corresponds to a range of numbers
  number_columns = [
    (1..9).to_a, (10..19).to_a, (20..29).to_a,
    (30..39).to_a, (40..49).to_a, (50..59).to_a,
    (60..69).to_a, (70..79).to_a, (80..90).to_a
  ]

  # For each column, randomly pick 1 to 3 numbers and sort them
  selected_numbers_per_column = number_columns.map { |range| range.sample(rand(1..3)).sort }

  # Initialize a blank 3x9 grid with nil values
  ticket = Array.new(3) { Array.new(9, nil) }

  # Distribute the selected numbers into random rows within their respective columns
  selected_numbers_per_column.each_with_index do |numbers, col_index|
    random_row_order = (0..2).to_a.shuffle
    numbers.each_with_index do |number, i|
      row_index = random_row_order[i]
      ticket[row_index][col_index] = number
    end
  end

  # Make sure no row has more than 5 numbers
  ticket.each do |row|
    filled_cells = row.count(&:itself)
    if filled_cells > 5
      # Randomly remove numbers to limit the row to exactly 5
      excess_indices = row.each_index.select { |i| row[i] }.sample(filled_cells - 5)
      excess_indices.each { |i| row[i] = nil }
    end
  end

  # Fix any row that has fewer than 5 numbers by borrowing from rows with extras
  ticket.each do |row|
    while row.count(&:itself) < 5
      # Find a row that has more than 5 numbers
      helper_row = ticket.find { |r| r.count(&:itself) > 5 }
      break unless helper_row

      # Find a column where the helper row has a number and the current row is empty
      transferable_column = (0..8).find { |col| helper_row[col] && row[col].nil? }

      if transferable_column
        # Move the number from the helper row to the current row
        row[transferable_column] = helper_row[transferable_column]
        helper_row[transferable_column] = nil
      else
        break
      end
    end
  end

  ticket
end

def print_ticket(ticket, ticket_number = nil)
  puts "\n Ticket ##{ticket_number + 1}:\n\n" if ticket_number
  ticket.each do |row|
    # Display numbers with leading zeroes, and mark empty cells with ' X '
    formatted_row = row.map { |cell| cell ? cell.to_s.rjust(2, '0') : ' X ' }.join(" | ")
    puts formatted_row
  end
  puts "\n" + "-" * 60
end

# Command line usage: Ask how many tickets to generate; default to 1
total_tickets = ARGV[0] ? ARGV[0].to_i : 1

# Generate and print each ticket
total_tickets.times do |i|
  ticket = generate_housie_ticket
  print_ticket(ticket, i)
end
