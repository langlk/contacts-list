#!/usr/bin/env ruby

require 'rspec'
require 'contact'

describe('ContactList::Contact') do
  it "stores a user's first name, last name, job title, company, and contact type" do
    bob = ContactList::Contact.new({:first_name => "Bob", :last_name => "Bobbington", :job_title => "Developer", :company => "Microsoft", :contact_type => "Professional"})
    expect(bob.first_name).to(eq("Bob"))
    expect(bob.last_name).to(eq("Bobbington"))
    expect(bob.job_title).to(eq("Developer"))
    expect(bob.company).to(eq("Microsoft"))
    expect(bob.contact_type).to(eq("Professional"))
  end
  it "will allow user to add a phone number to a contact" do
    bob = ContactList::Contact.new({:first_name => "Bob", :last_name => "Bobbington", :job_title => "Developer", :company => "Microsoft", :contact_type => "Professional"})
    bob.phone = "555-555-5555"
    expect(bob.phone).to(eq("555-555-5555"))
  end
  it "will allow user to add email to a contact" do
    bob = ContactList::Contact.new({:first_name => "Bob", :last_name => "Bobbington", :job_title => "Developer", :company => "Microsoft", :contact_type => "Professional"})
    bob.email = "bob@email.com"
    expect(bob.email).to(eq("bob@email.com"))
  end
  it "will allow user to add addresss to a contact" do
    bob = ContactList::Contact.new({:first_name => "Bob", :last_name => "Bobbington", :job_title => "Developer", :company => "Microsoft", :contact_type => "Professional"})
    bob.address = "1234 Redmond Way, Redmond, WA 99999"
    expect(bob.address).to(eq("1234 Redmond Way, Redmond, WA 99999"))
  end
  it "Contact class allows multiple phone numbers, email addresses, and addresses for a contact" do
    bob = ContactList::Contact.new({:first_name => "Bob", :last_name => "Bobbington", :job_title => "Developer", :company => "Microsoft", :contact_type => "Professional"})
    bob.phone("555-555-555", "work")
    bob.phone("111-111-1111" "cell")


  end
end
