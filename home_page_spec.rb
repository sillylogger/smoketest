require_relative './spec_helper'

feature 'the liputan6 homepage', js: true do

  given(:home) { HomePage.new }

  scenario 'checking all the links' do
    home.load
    expect(home).to be_displayed
    expect(home.navbar.links.size).to eq(13)
  end

end

