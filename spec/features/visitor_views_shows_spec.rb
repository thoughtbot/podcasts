require 'spec_helper'

feature 'Viewing the shows' do
  scenario 'Visitor views the list of shows' do
    show1 = create(:show, title: 'First show')
    show2 = create(:show, title: 'Second show')

    visit shows_path

    expect(page).to have_content show1.title
    expect(page).to have_content show2.title

    click_link show1.title

    expect(current_path).to eq show_episodes_path(show1)
  end
end
