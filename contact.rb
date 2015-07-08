require 'pg'
 
 
class Contact
  attr_accessor :firstname, :lastname, :email
  attr_reader :id
  
  def initialize (firstname, lastname, email, id=nil)
    @firstname=firstname
    @lastname=lastname
    @email=email
    @id=id
  end
 
  def self.conn
    PG.connect(
    host: 'localhost',
    dbname: 'contacts',
    user: 'development',
    password: 'development')
  end
 
  def save
    if id.nil?
    Contact.conn.exec_params("INSERT INTO contacts (firstname, lastname, email) VALUES($1, $2, $3)", [@firstname, @lastname, @email])
    else
    Contact.conn.exec_params("UPDATE contacts SET firstname=$1, lastname=$2, email=$3 WHERE id=$4", [@firstname, @lastname, @email, @id])
    end
  end
 
  def destroy
    Contact.conn.exec_params("DELETE contacts (firstname, lastname, email) FROM contacts WHERE VALUES($1)",[@id])
  end
 
  def to_s
    "#{@id} #{@firstname} #{@lastname} #{@email}"
  end
 
   def self.all
    contacts = []
    Contact.conn.exec( "SELECT * FROM contacts" ) do |rows|
      rows.each do |row|
        next_contact = Contact.new(
          row["firstname"],
          row["lastname"],
          row["email"],
          row["id"])
        contacts << next_contact
      end
    end
    contacts
    end
 
  def self.find(contact)
    Contact.conn.exec_params("SELECT firstname, lastname, email FROM contacts WHERE id=$1;",[@id])
  end
 
  def self.findAllFirstname(firstname)
    Contact.conn.exec_params("SELECT firstname, lastname, email FROM contacts WHERE firstname=$1",[@firstname])
  end
 
  def self.findAllByLastname(lastname)
   Contact.conn.exec_params("SELECT firstname, lastname, email FROM contacts WHERE lastname=$1",[@lastname])
  end
 
  def self.findEmail(email)
    Contact.conn.exec_params("SELECT firstname, lastname, email FROM contacts WHERE email=$1",[@email])
  end
 
end
