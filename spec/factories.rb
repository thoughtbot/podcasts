FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    email
    password 'password'
  end

  factory :show do
    email
    description 'Some people talking'
    itunes_url 'http://itunes.com'
    keywords 'design, development'
    short_description 'Weekly podcast of some people talking'
    slug 'giantrobots'
    title 'Talking Show'
  end

  factory :episode do
    show
    description 'A really great episode'
    published_on { 1.day.ago }
    title 'Episode Title'

    factory :future_episode do
      published_on { 1.day.from_now }
    end
  end
end
