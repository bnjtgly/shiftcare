require 'json'

class Search
  def initialize(file_path)
    @clients = JSON.parse(File.read(file_path))
  end

  def search_by_name(query)
    matching_clients = @clients.select { |client| client['full_name'].downcase.include?(query.downcase) }
    display_clients(matching_clients)
  end

  def search_by_email(query)
    matching_clients = @clients.select { |client| client['email'].downcase.include?(query.downcase) }
    display_clients(matching_clients)
  end

  def find_duplicate_emails
    email_count = Hash.new(0)
    duplicate_emails = []

    @clients.each do |client|
      email = client['email']
      email_count[email] += 1
      duplicate_emails << email if email_count[email] > 1
    end
    
    duplicate_emails.uniq.each do |dups|
      search_by_email(dups)
    end
  end
  private

  def display_clients(clients)
    clients.each do |client|
      puts "ID: #{client['id']}"
      puts "Name: #{client['full_name']}"
      puts "Email: #{client['email']}"
      puts "-" * 30
    end
  end
end