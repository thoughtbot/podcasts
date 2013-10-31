require 'base64'

class GithubClient
  include Rails.application.routes.url_helpers

  attr_accessor :episode

  def initialize(episode)
    @episode = episode
  end

  def post_episode
    github_client.create_contents(repository, path, message, content)
  end

  private

  def repository
    'cpytel/blogtest'
  end

  def path
    "source/#{date}-#{slug}.html.markdown"
  end

  def date
    episode.published_on.to_s(:blog)
  end

  def slug
    episode.title.parameterize
  end

  def message
    "#{date} #{episode.show.title}"
  end

  def content
    blog_post_body
  end

  def blog_post_body
    description = <<-DESCRIPTION
---
title: "#{episode.show.short_title} Podcast #{episode.full_title}"
tags: podcast,#{episode.tags}
type: link
url: #{show_episode_url(episode.show, episode, host: HOST)}
---
#{episode.description}

* [Episode Notes and Links](#{show_episode_url(episode.show, episode, host: HOST)})
* [Subscribe via iTunes](#{episode.show.itunes_url})
* [Subscribe via RSS](#{show_episodes_url(episode.show, format: :xml, host: HOST)})
* [Direct Download](#{show_episode_url(episode.show, episode, format: :mp3, host: HOST)})
DESCRIPTION
  end

  def github_client
    Octokit::Client.new(
      login: ENV['GITHUB_USER'],
      password: ENV['GITHUB_PASSWORD']
    )
  end
end
