require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/contact'
require 'pry'

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
