require_relative 'contact'
class CRM

  def initialize

  end

  def main_menu
    while true 
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '

  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit

    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp
    print 'Enter Last Name: '
    last_name = gets.chomp
    print 'Enter Email Adress: '
    email = gets.chomp
    print 'Enter a Note: '
    note = gets.chomp
    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    print 'Enter the id of the contact you would like to modify'
   user_input = gets.chomp
   id = user_input.to_i
   contact_to_be_modified = Contact.find(id)
   print "Enter Attribute you wish to change: (First_name, last_name, email, note)"
   key = gets.chomp
   print "Enter new value of attribute:"
   value = gets.chomp
   contact_to_be_modified.update(key,value)
  end

  def delete_contact
    print 'What is the id of the contact you would like to delete?'
    id = gets.chomp.to_i
    contact_deleting = Contact.find(id)
    contact_deleting.delete   
  end

  def display_all_contacts
    p Contact.all
  end

  def search_by_attribute
    print 'Which attribute do you want to search by?'
    attribute = gets.chomp
    print 'What is the value of the attribute you want to search by?'
    value = gets.chomp
     puts Contact.find_by(attribute,value) 
  end

end

at_exit do
  ActiveRecord::Base.connection.close
end

a_crm_app = CRM.new
p a_crm_app
a_crm_app.add_new_contact