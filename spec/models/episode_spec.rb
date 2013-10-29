require 'spec_helper'

describe Episode do
  context 'associations' do
    it { should belong_to(:show) }
  end

  context 'validations' do
    it { should validate_presence_of :description }
    it { should validate_presence_of :published_on }
    it { should validate_presence_of :show }
    it { should validate_presence_of :title }
    it { should validate_presence_of :tags }
  end

  it 'assigns the next number for the show when created' do
    episode = build(:episode, number: nil)

    episode.save!

    expect(episode.number).to eq 1
    expect(create(:episode, number: nil, show: episode.show).number).to eq 2

    expect(create(:episode, number: nil).number).to eq 1
  end

  it 'does not assign new number when created' do
    episode = build(:episode, number: 99)

    episode.save!

    expect(episode.number).to eq 99
  end

  describe '#to_param' do
    it 'returns the episode number' do
      episode = create(:episode, number: 99)

      expect(episode.to_param).to eq 99
    end
  end

  describe "self.published" do
    it "does not include episodes published in the future" do
      published = create(:episode, published_on: 1.day.ago)
      future = create(:episode, published_on: 1.day.from_now)

      expect(Episode.published).to include published
      expect(Episode.published).not_to include future
    end

    it "orders by most recently published" do
      create(:episode, published_on: 7.days.ago)
      first = create(:episode, published_on: 2.days.ago)

      expect(Episode.published.first).to eq first
    end
  end

  describe ".full_title" do
    it 'includes the episode number and title' do
      episode = create(:episode, title: 'Hello')

      expect(episode.full_title).to eq "Episode #{episode.number}: #{episode.title}"
    end
  end

  describe ".rss_pub_date" do
    it 'conforms to the rss specification for publication date' do
      Timecop.freeze(Time.zone.today) do
        expected_date = 1.days.ago.to_date
        episode = create(:episode, published_on: expected_date)

        expect(episode.rss_pub_date).to eq expected_date.strftime('%a, %d %b %Y %H:%M:%S %z')
      end
    end
  end

  describe '.increment_downloads' do
    it 'increments the download count by 1' do
      episode = create(:episode, downloads_count: 4)
      episode.increment_downloads

      expect(episode.downloads_count).to eq 5
    end
  end

  describe '.published_today' do
    it 'only includes episodes published_on today' do
      create(:episode, published_on: Time.zone.today, title: 'today')
      create(:episode, published_on: 1.day.from_now, title: 'tomorrow')
      create(:episode, published_on: 1.week.ago, title: 'last week')

      expect(Episode.published_today.map(&:title)).to eq(%w(today))
    end
  end

  it 'queues up a fetch from url if one is supplied' do
    mp3_url = 'http://example.com/test.mp3'
    episode = build(:episode, new_mp3_url: mp3_url)
    EpisodeMp3FetchJob.stub(:enqueue)

    episode.save!

    expect(EpisodeMp3FetchJob).to have_received(:enqueue).
      with(episode.id, mp3_url)
  end

  it 'reprocesses the mp3 file if certain attributes change' do
    attachment = double(save: nil, assign: nil, flush_errors: nil)
    episode = create(:episode)
    episode.stub(mp3: attachment)

    episode.show = create(:show)
    episode.save!
    episode.published_on = Date.tomorrow
    episode.save!
    episode.number = 22
    episode.save!

    attributes = %w(description title notes)
    attributes.each do |attribute|
      episode[attribute] = 'test'
      episode.save!
    end

    expect(attachment).to have_received(:save).at_least(6).times
    expect(attachment).to have_received(:assign).at_least(6).times
  end

  describe '#tag_array' do
    it 'returns the comma seperated tags split into an array' do
      episode = create(:episode, tags: 'rails, testing')

      expect(episode.tag_array).to eq %w(rails testing)
    end
  end
end
