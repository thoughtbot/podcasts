require 'spec_helper'

feature 'Viewing a podcast' do
  scenario 'Visitor views the list of published podcast episodes for a show' do
    episode1 = create(
      :episode,
      title: 'Good episode',
      description: 'this was good',
      duration: 1210
    )
    create(
      :episode,
      title: 'Not so good',
      description: 'this was bad',
      duration: 0,
      show: episode1.show
    )
    create(:future_episode, title: 'Future episode', show: episode1.show)
    create(:future_episode, title: 'Another show')

    visit show_episodes_path(episode1.show)

    expect(page).to have_title "thoughtbot : #{episode1.show.title}"
    expect(page).to have_content "Episode ##{episode1.number}"
    expect(page).to have_content 'Good episode'
    expect(page).to have_content 'this was good'
    expect(page).to have_content 'Not so good'
    expect(page).to have_content 'this was bad'
    expect(page).not_to have_content 'Future episode'
    expect(page).not_to have_content 'Another show'
  end

  scenario 'Visitor views an individual podcast episode' do
    episode = create(
      :episode,
      title: 'Good episode',
      description: 'this was good',
      file_size: 13540249,
      duration: 1210
    )

    visit show_episodes_path(episode.show)
    click_link 'Good episode'

    expect(page).to have_title "thoughtbot : #{episode.show.title} : #{episode.full_title}"
    expect_to_see_episode_information(episode)
    expect_to_see_audio_player(episode)
  end

  def expect_to_see_episode_information(episode)
    expect(page).to have_css('h1 a', text: episode.title)

    within 'aside' do
      expect(page).to have_content("Episode ##{episode.number}")
      expect(page).to have_content('20 minutes')
    end

    expect(page).to have_css('.listen', text: /13 MB/)
  end

  def expect_to_see_audio_player(episode)
    expect(page).
      to have_css("audio source[src='#{show_episode_path(episode.show, episode, format: :mp3)}']")
  end
end

