require 'rails_helper'
RSpec.feature 'Users can create links' do
  scenario 'with valid attributes' do
    visit '/'

    click_link 'New Link'
    fill_in 'Title', with: 'Vsn'
    fill_in 'Url', with: 'vsn.com'
    click_button 'Create Link'

    expect(page).to have_content 'Link has been created.'

  end

  scenario 'with invalid attributes' do
    visit '/'

    click_link 'New Link'

    click_button 'Create Link'

    expect(page).to have_content 'Link has not been created.'
  end
end
