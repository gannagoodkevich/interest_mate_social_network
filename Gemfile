source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails',      '6.0.1'
gem 'puma',       '3.12.1'
gem 'sass-rails', '5.1.0'
gem 'webpacker',  '4.0.7'
gem 'turbolinks', '5.2.0'
gem 'jbuilder',   '2.9.1'
gem 'bootsnap',   '1.4.4', require: false
gem 'bootswatch-rails'
gem 'bootstrap-sass'
gem 'bootstrap_form'
gem 'rails-i18n'

group :development, :test do
  gem 'byebug',  '11.0.1', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
end

group :development do
  gem 'web-console',           '4.0.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.1.0'
  gem 'spring-watcher-listen', '2.0.1'
  gem 'simple_form'
  gem 'kaminari'
  gem 'rails_bootstrap_navbar'
  gem 'jquery-rails'
  gem 'jquery-turbolinks'
  gem 'warden'
  gem 'bcrypt'
  gem 'sidekiq'
  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
  gem "sidekiq-cron", "~> 1.1"
  gem 'sidekiq-scheduler'
  gem "shrine", "~> 3.0"
  gem "image_processing"
  gem "mini_magick", ">= 4.3.5"
end

group :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rails_helper'
  gem 'capybara',           '3.28.0'
  gem 'selenium-webdriver', '3.142.4'
  gem 'webdrivers',         '4.1.2'
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers', branch: 'rails-5'
end

group :production do
  gem 'pg', '1.1.4'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]