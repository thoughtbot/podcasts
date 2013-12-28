require 'spec_helper'

describe 'Google results' do
  it 'includes podcast page with short description' do
    show = create(:show, short_description: 'Short')

    visit show_episodes_path(show)

    expect(page).
      to have_css("meta[name='description'][content='Short']", visible: false)
  end

  it 'includes episode page with description' do
    episode = create(:episode, description: 'Listen')

    visit show_episode_path(episode.show, episode)

    expect(page).
      to have_css("meta[name='description'][content='Listen']", visible: false)
  end
end
