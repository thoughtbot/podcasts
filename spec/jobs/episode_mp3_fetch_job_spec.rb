require 'spec_helper'

describe EpisodeMp3FetchJob do
  it_behaves_like 'a Delayed Job that notifies Airbrake about errors'

  it 'adds given usernames to a github team' do
    episode = double(:id => 1, :"mp3=" => nil, :save! => true)
    Episode.stub(find: episode)
    url = 'http://example.com/test.mp3'

    EpisodeMp3FetchJob.new(episode.id, url).perform

    expect(Episode).to have_received(:find).with(episode.id)
    expect(episode).to have_received(:"mp3=").with(URI.parse(url))
    expect(episode).to have_received(:save!)
  end
end
