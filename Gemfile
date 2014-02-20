source 'https://rubygems.org'

ruby '2.1.0'

gem 'airbrake'
gem 'aws-sdk', '= 1.6.2' # Bug https://github.com/thoughtbot/paperclip/issues/751
gem 'bluecloth'
gem 'coffee-rails'
gem 'delayed_job_active_record', '>= 4.0.0'
gem 'delayed_paperclip'
gem 'devise'
gem 'email_validator'
gem 'high_voltage'
gem 'jquery-rails'
gem 'omniauth-google-oauth2'
gem 'paperclip'
gem 'pg'
gem 'rack-timeout'
gem 'rails', '>= 4.0.0'
gem 'rails_admin'
gem 'recipient_interceptor'
gem 'ruby-mp3info', '~> 0.8'
gem 'sass-rails'
gem 'simple_form'
gem 'uglifier'
gem 'unicorn'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'foreman'
  gem 'spring'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails', '>= 2.14'
end

group :test do
  gem 'capybara-webkit', '>= 1.0.0'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
end

group :staging, :production do
  gem 'dalli'
  gem 'kgio'
  gem 'memcachier'
  gem 'newrelic_rpm', '>= 3.6.7'
  gem 'rack-cache'
  gem 'rails_12factor'
end
