gem 'activerecord', '=4.2.10'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord::Base
    
  field :first_name, as: :string
  field :last_name, as: :string
  field :email, as: :string
  field :note, as: :text
 
  def full_name
    return "#{@first_name} #{@last_name}"
  end
end


  Contact.auto_upgrade!


  

 
# betty = Contact.create('Betty', 'Maker', 'bettymakes@gmail.com', 'Loves Pokemon')
# lily = Contact.create('Lily', 'Jones', 'lilianjones@gmail.com', '17 yrs old')
# p betty
# p betty.update("first_name", "betsy")
# p Contact.find_by("last_name", "Maker")
# p betty
# p Contact.all
# p lily
# p lily.full_name
# p lily.delete
# p Contact.all
# p Contact.find_by("first_name", "anne")


