	require_relative "contact"

class Application 
def prompt_menu
		puts  "Here is a list of available commands:
    new  - Create a new contact
    list - List all contacts
    show - Show a contact
    find - Find a contact"
end

def app_on
	prompt_menu
  user_input = gets.chomp
  case user_input
  when "new" 
  	puts "email"
  	email = gets.chomp
  	puts "first name"
  	first_name = gets.chomp
  	puts "last name"
  	last_name = gets.chomp
  	contact = Contact.new(email, first_name, last_name)
  when "list"
  	Contact.list
  when "show"
  	puts "Who are you looking for?"
  	search = gets.chomp
  	Contact.find_all_by_lastname(name)
  	Contact.find_all_by_firstname(name)
  	Contact.find_all_by_email(email)
  when "find"
  	id = gets.chomp
  	Contact.find(id)
  else 
   puts "Invalid Input"
  end
  app_on
end
end
app = Application.new

app.app_on