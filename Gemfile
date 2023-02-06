source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 6.1.6'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.4'
gem 'turbolinks', '~> 5.2'
gem 'jbuilder', '~> 2.11'
gem 'turbo-rails', '~> 1.1', '>= 1.1.1'
gem 'rails-bootstrap-tabs', '~> 0.3.2'

gem 'jwt'
gem 'devise'
gem 'rolify'
gem 'pundit'
gem 'pagy'
gem 'slim'
gem 'simple_form'
gem 'rack-cors'
gem 'jsonapi-serializer'
gem 'seedbank'

gem 'bootsnap', require: false
gem 'net-smtp', require: false
gem 'net-imap', require: false
gem 'net-pop', require: false
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'byebug'
  gem 'pry-rails'
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem 'web-console', '~> 4.2'
  gem 'rack-mini-profiler', '~> 3.0'
  gem 'listen', '~> 3.7'
  gem 'spring'
  gem 'rubocop', '~> 1.23', require: false
  gem 'brakeman', require: false
  gem 'letter_opener'
  gem 'annotate'
  gem 'bullet'
end

group :test do
  gem 'simplecov', '~> 0.17.1', require: false
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'shoulda-matchers'
end
