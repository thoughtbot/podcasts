require 'spec_helper'

describe GithubClient do
  it 'posts an episode to the blog' do
    episode = create(:episode, tags: 'rails,testing')
    request = stub(perform: nil)
    post = stub(post: request)
    client = stub()
    Tumblr::Post::Link.stubs(:new).returns(post)
    Tumblr::Client.stubs(:new).returns(client)

    tumblr_client = TumblrClient.new
    tumblr_client.post_episode(episode)

    expect(Tumblr::Post::Link).to have_received(:new).with(
      {
        state: 'published',
        tags: 'podcast,rails,ruby',
        format: 'markdown',
        title: "#{episode.show.short_title} Podcast #{episode.full_title}",
        url: show_episode_url(episode.show, episode, host: HOST),
        description: <<-DESCRIPTION
#{episode.description}

* [Episode Notes and Links](#{show_episode_url(episode.show, episode, host: HOST)})
* [Subscribe via iTunes](#{episode.show.itunes_url})
* [Subscribe via RSS](#{show_episodes_url(episode.show, format: :xml, host: HOST)})
* [Direct Download](#{show_episode_url(episode.show, episode, format: :mp3, host: HOST)})
        DESCRIPTION
      }
    )
    expect(post).to have_received(:post).with(client)
    expect(request).to have_received(:perform)
  end
end
