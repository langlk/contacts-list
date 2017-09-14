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

  it "updates contact information and saves" do
    visit('/')
    click_link('Bob Bobbington')
    click_button('Edit')
    fill_in('job-title', :with => "Project Manager")
    fill_in('phone-number', :with => "555 555 5555")
    fill_in('email', :with => "bob@email.com")
    fill_in('address', :with => "1234 redmond way, redmond wa 89389")
    click_button('Update')
    expect(page).to have_content("Project Manager at Microsoft")
    expect(page).to have_content("Default: 555 555 5555")
    expect(page).to have_content("Default: bob@email.com")
    expect(page).to have_content("Default: 1234 redmond way, redmond wa 89389")
  end
end
