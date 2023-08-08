require './search'

class Main
  file_path = 'clients.json'
  client_search = Search.new(file_path)

  puts "Available commands:"
  puts "1. Search clients by name"
  puts "2. Find clients with duplicate emails"
  print "Enter command (1 or 2): "
  command = gets.chomp.to_i

  case command
  when 1
    print "Enter search query: "
    query = gets.chomp
    client_search.search_by_name(query)
  when 2
    client_search.find_duplicate_emails
  else
    puts "Invalid command"
  end
end