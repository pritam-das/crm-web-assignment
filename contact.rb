class Contact

@@contacts = []
@@id = 1
attr_reader :id
attr_accessor :first_name, :last_name, :email, :note
  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id=@@id
    @@id+=1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
      @new_contact = Contact.new(first_name, last_name, email, note)
      @@contacts << @new_contact
      @new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    puts "You have the following contacts in your directory:\n"
    @@contacts.each do |each_contact|
      puts "#{each_contact.first_name} #{each_contact.last_name}"
    end
  end

def self.number
  @@contacts.size
end
  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |each_contact|
      if (each_contact.id == id)
        return each_contact
      end
    end

  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, value)
      if attribute == 'first_name'
        self.first_name = value
      elsif attribute == 'last_name'
        self.last_name = value
      elsif attribute == 'email'
        self.email = value
      elsif attribute == 'note'
        self.note = value
      end
end


  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty

  def self.find_by(attribute, value)
    if ['first_name', 'last_name', 'email', 'note', 'id'].include?(attribute)
      @@contacts.find { |contact| contact.send(attribute) == value }
    else
      nil
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
    puts "All your contacts have been succesfully deleted!"
    @@contacts
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
     @@contacts.delete_if { |contact| contact.id == self.id }
  end

  # Feel free to add other methods here, if you need them.

end

# Copy your entire Contact class from the old crm assignment here.
# Then, run the following at the command line:
#
#   ruby test/contact_test.rb
#
# If your implementation of the Contact class is 'right', then you should see that all tests pass!
