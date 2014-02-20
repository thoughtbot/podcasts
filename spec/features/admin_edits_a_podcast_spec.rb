require 'spec_helper'

feature 'Adding episodes' do
  scenario 'Admin is able to navigate to the new show page' do
    user = create(:user)
    create(:show)

    visit rails_admin_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    within '.sidebar-nav' do
      click_link 'Episodes'
    end

    click_link 'Add new'

    expect(page).to have_content('Mp3')
  end
end
