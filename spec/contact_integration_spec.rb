require 'app'
require 'capybara/rspec'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('', {:type => :feature}) do
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
