require 'rails_helper'

RSpec.feature 'Users can delete links' do
  scenario 'successfully' do
    FactoryGirl.create(:link, title: 'VSN', url:'cardscorner.com')

    visit '/'

    click_link 'VSN'
    click_link 'Delete Link'

    expect(page).to have_content 'Link has been deleted.'
    expect(page).to_not have_content 'VSN'
  end

end
