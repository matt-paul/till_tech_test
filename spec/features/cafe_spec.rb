require 'spec_helper'

feature 'Adding a new customer' do
  scenario 'The homepage takes you to the receipt page' do
    visit '/'
    fill_in 'name', with: 'Matt'
    fill_in 'item', with: 'Tiramisu'
    fill_in 'quantity', with: 2
    click_button 'Add order'
    expect(current_path).to eq ('/receipt')
    expect(page).to have_content "Your receipt:"
  end



end
