require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/contact'
require 'pry'

get("/") do
  @error = nil
  @contacts = ContactList::Contact.all
  erb(:contact_list)
end

post('/') do
  attributes = {
    :first_name => params["first-name"],
    :last_name => params["last-name"],
    :job_title => params["job-title"],
    :company => params["company"],
    :contact_type => params["contact-type"]
  }
  contact = ContactList::Contact.new(attributes)
  @error = contact.save
  @contacts = ContactList::Contact.all
  erb(:contact_list)
end

get('/contact/:name_route') do
  name = params[:name_route].split('_').join(' ')
  @contact = ContactList::Contact.find(name)
  erb(:contact)
end

post('/edit/:name_route') do
  name = params[:name_route].split('_').join(' ')
  @contact = ContactList::Contact.find(name)
  erb(:edit)
end

post('/contact/:name_route') do
  name = params[:name_route].split('_').join(' ')
  @contact = ContactList::Contact.find(name)
  @contact.job_title = params["job-title"]
  @contact.company = params["company"]
  @contact.contact_type = params["contact-type"]

  count = 0
  while params.has_key?("phone-number-" + count.to_s)
    phone_number = params["phone-number-" + count.to_s]
    if phone_number.length != 0
      phone_type = params["phone-type-" + count.to_s]
      if phone_type.length == 0
        @contact.add_phone(phone_number)
      else
        @contact.add_phone(phone_number, phone_type)
      end
    end
    count += 1
  end

  count = 0
  while params.has_key?("email-" + count.to_s)
    email = params["email-" + count.to_s]
    if email.length != 0
      email_type = params["email-type-" + count.to_s]
      if email_type.length == 0
        @contact.add_email(email)
      else
        @contact.add_email(email, email_type)
      end
    end
    count += 1
  end

  count = 0
  while params.has_key?("address-" + count.to_s)
    address = params["address-" + count.to_s]
    if address.length != 0
      address_type = params["address-type-" + count.to_s]
      if address_type.length == 0
        @contact.add_address(address)
      else
        @contact.add_address(address, address_type)
      end
    end
    count += 1
  end
  erb(:contact)
end

post("/delete/:name_route") do
  @contact_name = params[:name_route].split('_').join(' ')
  contact = ContactList::Contact.find(@contact_name)
  contact.delete
  erb(:delete)
end
