require './app'
require 'capybara/rspec'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Contact List', {:type => :feature}) do
  it "saves a new contact and shows in list" do
    visit('/')
    fill_in('first-name', :with => "Bob")
    fill_in('last-name', :with => "Bobbington")
    fill_in('job-title', :with => "Developer")
    fill_in('company', :with => "Microsoft")
    fill_in('contact-type', :with => "Professional")
    click_button("Add")
    expect(page).to have_content("Bob Bobbington")
  end

  it "shows full contact information when user clicks a contact in list" do
    visit('/')
    fill_in('first-name', :with => "John")
    fill_in('last-name', :with => "Johnson")
    fill_in('job-title', :with => "Developer")
    fill_in('company', :with => "Microsoft")
    fill_in('contact-type', :with => "Professional")
    click_button("Add")
    click_link("John Johnson")
    expect(page).to have_content("Professional Contact")
    expect(page).to have_content("John Johnson")
    expect(page).to have_content("Developer at Microsoft")
  end

  it "shows error message when user adds contact that already exists" do
    visit('/')
    fill_in('first-name', :with => "Bob")
    fill_in('last-name', :with => "Bobbington")
    fill_in('job-title', :with => "Developer")
    fill_in('company', :with => "Microsoft")
    fill_in('contact-type', :with => "Professional")
    click_button("Add")
    expect(page).to have_content("Bob Bobbington is already a contact")
  end

  it "does not add blank phone/email/addresses to contact" do
    visit('/')
    click_link('John Johnson')
    click_button('Edit')
    click_button('Update')
    expect(page).to have_no_content('Default:')
  end

  it "updates contact information and saves" do
    visit('/')
    click_link('Bob Bobbington')
    click_button('Edit')
    fill_in('job-title', :with => "Project Manager")
    fill_in('phone-number-0', :with => "555 555 5555")
    fill_in('email-0', :with => "bob@email.com")
    fill_in('address-0', :with => "1234 redmond way, redmond wa 89389")
    click_button('Update')
    expect(page).to have_content("Project Manager at Microsoft")
    expect(page).to have_content("Default: 555 555 5555")
    expect(page).to have_content("Default: bob@email.com")
    expect(page).to have_content("Default: 1234 redmond way, redmond wa 89389")
  end

  it "allows user to add multiple phone/email/address entries" do
    visit('/')
    click_link('Bob Bobbington')
    click_button('Edit')
    fill_in('phone-number-1', :with => "666 666 6666")
    fill_in('phone-type-1', :with => "home")
    fill_in('email-1', :with => "bobby@email.com")
    fill_in('email-type-1', :with => "home")
    fill_in('address-1', :with => "6666 hell st bellevue wa 98989")
    fill_in('address-type-1', :with => "home")
    click_button('Update')
    expect(page).to have_content("home: 666 666 6666")
    expect(page).to have_content("home: bobby@email.com")
    expect(page).to have_content("home: 6666 hell st bellevue wa 98989")
    expect(page).to have_content("Default: 555 555 5555")
    expect(page).to have_content("Default: bob@email.com")
    expect(page).to have_content("Default: 1234 redmond way, redmond wa 89389")
  end

  it "allows user to delete contacts" do
    visit('/')
    click_link('Bob Bobbington')
    click_button('Delete')
    expect(page).to have_content("Bob Bobbington has been deleted.")
    click_link("Back to Contacts List")
    expect(page).to have_no_content('Bob Bobbington')
  end
end
