require 'pg'

class Contact
	attr_accessor :firstname, :lastname, :email

	def initialize(firstname, lastname, email)
		@firstname = firstname
		@lastname = lastname
		@email = email
	end



	def save
		INSERT INTO contacts (firstname, lastname, email)
	end

	def destroy(id)
		"DELETE FROM contacts WHERE id = id"
	end

	def self.find(id)
		"SELECT c.id, c.firstname, c.lastname, c.email
		FROM contacts AS c
		WHERE c.id = id"
	end

	def self.list
		"SELECT c.firstname, c.lastname FROM contacts AS c"
	end

	def self.find_all_by_lastname(name)
		"SELECT c.id, c.firstname, c.lastname, c.email
		FROM contacts AS c
		WHERE c.lastname = name"
	end

	def self.find_all_by_firstname(name)
		"SELECT c.id, c.firstname, c.lastname, c.email
		FROM contacts AS c
		WHERE c.firstname = name"
	end

	def self.find_by_email(email)
		"SELECT c.id, c.firstname, c.lastname, c.email
		FROM contacts AS c
		WHERE c.email = email"
	end
end


	def app_on
		puts  "Here is a list of available commands:
	    new  - Create a new contact
	    list - List all contacts
	    show - Show a contact
	    find - Find a contact"
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
	  	puts "Invalid input"
	  end
	end
