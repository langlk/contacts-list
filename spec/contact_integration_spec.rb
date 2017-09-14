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
  # it('will check if users input matches the answer') do
  #   visit('/')
  #   fill_in('name', :with => 'mango')
  #   fill_in('rank', :with => 1)
  #   click_button('submit')
  #   expect(page).to have_content('mango')
  #   fill_in('name', :with => 'mango')
  #   fill_in('rank', :with => 1)
  #   click_button('submit')
  #   expect(page).to have_content("Sorry the rank or item name has already been entered")
  # end
end
