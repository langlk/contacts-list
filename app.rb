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
  erb(:contact)
end
