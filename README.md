# Contacts List

#### _Project in Ruby_

#### By Kelsey Langlois and Snow Vilay

## Description

_A Ruby Web App that stores a user's contact list._

## Setup/Installation Requirements

_You can view this app online [here](https://mighty-stream-71763.herokuapp.com/). To set up on your own machine, follow the steps below:_

* Clone this repository
* Run ```bundle install``` in the project root.
* Run ```ruby app.rb```
* Open ```localhost:4567``` in your web browser

## Specifications

* Contact class stores a user's first name, last name, job title, company, and contact type.
  * Example input: "Bob", "Bobbington", "Developer", "Microsoft", "Professional"
  * Example output: {:first_name => "Bob", :last_name => "Bobbington", :job_title => "Developer", :company => "Microsoft", :contact_type => "Professional"}
* Contact class allows user to add a phone number to a contact.
  * Example input: bob.phone("206-555-1234")
  * Example output: bob.phone("206-555-1234")
* Contact class allows user to add email to a contact.
  * Example input: bob.email("bob@email.com")
  * Example output: bob.email = "bob@email.com"
* Contact class allows user to add an address to a contact.
  * Example input: bob.address("1234 Redmond Way", "Redmond")
, "WA", "99999")
  * Example output: bob.address = "1234 Redmond Way, Redmond, WA 99999"
* Contact class allows multiple phone numbers, email addresses, and addresses for a contact.
  * Example input: bob.phone("555-555-555", "work") bob.phone("111-111-1111" "cell")
  * Example output: bob.phone = {"work" => "555-555-5555", "cell" => "111-111-1111"}
* Contact class sets a phone number, address, or email to "default" if it's not given a type.
  * Example input: bob.phone("555-555-5555")
  * Example output: bob.phone = {"default" => "555-555-555"}
* Contact class can provide list of all Contact objects.
  * Example input: Contact.all
  * Example output: [bob]
* Contact class allows user to save a contact object to view later
  * Example input: bob.save
  * Example output: Contact.find("Bob")
* Contact doesn't allow saving a contact object with the same full name as an existing saved contact.
  * Example input: bob.save
  * Example output: "Bob Bobbington is already a contact."
* Contact class can find a contact by name.
  * Example input: Contact.find("bob")
  * Example output: bob
* Contact class returns "Can't find contact" when contact name is not in list.
  * Example input: Contact.find("sam")
  * Example output: "Can't find contact"
* Contact class can clear contact list.
  * Example input: Contact.clear_all
  * Example output: Contact.all = {}
* User can delete a contact object from the contact list
  * Example input: bob.delete
  * Example output: Contact.find(bob) = "Can't find contact"

## Support and contact details

_Please contact [kels.langlois@gmail.com](mailto:kels.langlois@gmail.com) with questions, comments, or issues._

## Technologies Used

* Ruby
* Sinatra

### License

Copyright (c) 2017 **Kelsey Langlois and Snow Vilay**

*This software is licensed under the MIT license.*
