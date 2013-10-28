FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :show do
    credits 'Some people'
    description 'Some people talking'
    email
    itunes_url 'http://itunes.com'
    keywords 'design, development'
    short_description 'Weekly podcast of some people talking'
    slug 'giantrobots'
    title 'Talking Show'
  end

  factory :episode do
    show
    title 'Episode Title'
    description 'A really great episode'
    published_on { 1.day.ago }

    factory :future_episode do
      published_on { 1.day.from_now }
    end
  end
end
