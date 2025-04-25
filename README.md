# housie_ticket_generator

This is a simple Ruby script that generates Housie tickets — also known as Bingo. It's designed to follow all the classic ticket rules and is perfect for game nights, hobby projects, or as part of a larger app.


Generates tickets in the traditional 3 rows × 9 columns format.

Each row contains exactly 5 numbers.

Each column corresponds to a specific number range:

Column 1 → 1–9

Column 2 → 10–19

...

Column 9 → 80–90

Numbers are distributed randomly but in compliance with all standard rules.

Empty cells are represented clearly as placeholders denoted as "X".


How to Run It:

ruby housie_ticket_generator.rb [number_of_tickets]

or 

ruby housie_ticket_generator.rb [number_of_tickets] > ticket.txt    # Generates tickets in a txt file.


Example:

ruby housie_ticket_generator.rb      # Generates 1 ticket
ruby housie_ticket_generator.rb 5    # Generates 5 tickets

or 

ruby housie_ticket_generator.rb 10 > ticket.txt # Generates 10 tickets in a txt file.



Sample Output:

 Ticket #1:

 X  | 10 | 20 |  X  |  X  | 56 |  X  | 73 | 82
 03 |  X  |  X  | 31 |  X  |  X  | 61 |  X  | 89
 07 | 18 |  X  | 33 | 49 |  X  |  X  |  X  |  X

------------------------------------------------------------


