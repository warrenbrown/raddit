require 'rails_helper'

RSpec.feature 'Users can view links' do
  scenario 'successfully' do
    FactoryGirl.create(:link, title: 'VSN', url: 'vsn.com')
    visit '/'

    click_link 'VSN'

    expect(page).to have_content "vsn.com"
  end
end
