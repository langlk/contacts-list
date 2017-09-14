require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/contact'
require 'pry'

get("/")do
  @contacts = ContactList::Contact.all
  erb(:contact_list)
end
