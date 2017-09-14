require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/contact'
require 'pry'

bob = ContactList::Contact.new({:first_name => "Bob", :last_name => "Bobbington", :job_title => "Developer", :company => "Microsoft", :contact_type => "Professional"})
bob.add_phone("555-555-5555", "work")
bob.add_phone("111-111-1111", "cell")
bob.add_address("1234 Redmond Way, Redmond, WA 99999", "home")
bob.add_address("466 Microsoft Way, Redmond, WA 99999", "work")
bob.add_email("bob@email.com", "personal")
bob.save

get("/") do
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
  contact.save
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
  erb(:contact)
end
