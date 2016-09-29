require 'rails_helper'

RSpec.feature 'Users can edit links' do
  scenario 'With valid attributes' do
    FactoryGirl.create(:link, title: 'VSN', url: 'vsn.com')

    visit '/'
    click_link 'VSN'
    click_link 'Edit Link'

    fill_in 'Title', with: 'Football'
    click_button 'Update Link'

    expect(page).to have_content 'Link has been updated.'
    expect(page).to have_content 'Football'
  end

  scenario 'with invalid attributes' do
    FactoryGirl.create(:link, title: 'VSN', url: 'vsn.com')
    visit '/'
    click_link 'VSN'
    click_link 'Edit Link'

    fill_in 'Url', with: ''
    click_button 'Update Link'

    expect(page).to have_content 'Link has not been updated.'
  end
end
