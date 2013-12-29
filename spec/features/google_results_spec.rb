require 'spec_helper'

describe 'Google results include' do
  it 'home page with title and description' do
    title = I18n.t('layouts.app_name')
    description = I18n.t('layouts.description')
    selector = "meta[name='description'][content='#{description}']"

    visit '/'

    expect(page).to have_title(title)
    expect(page).to have_css(selector, visible: false)
  end

  it 'podcast page with title and description' do
    show = create(:show, short_description: 'Short')

    visit show_episodes_path(show)

    expect(page).to have_title(show.title)
    expect(page).
      to have_css("meta[name='description'][content='Short']", visible: false)
  end

  it 'episode page with title and description' do
    episode = create(:episode, description: 'Listen')

    visit show_episode_path(episode.show, episode)

    expect(page).to have_title(episode.title)
    expect(page).
      to have_css("meta[name='description'][content='Listen']", visible: false)
  end
end
