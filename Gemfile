# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'bootsnap', '1.4.4', require: false
gem 'bootstrap-sass'
gem 'bootstrap_form'
gem 'bootswatch-rails'
gem 'jbuilder', '2.9.1'
gem 'puma', '3.12.1'
gem 'rails', '6.0.1'
gem 'rails-i18n'
gem 'sass-rails', '5.1.0'
gem 'turbolinks', '5.2.0'
gem 'webpacker', '4.0.7'
gem 'rubocop', '~> 0.79.0', require: false
gem 'rubocop-rspec', require: false
gem 'rubocop-performance', require: false
gem 'rubocop-rails', require: false
gem 'rubocop-minitest', require: false
gem 'figaro'

group :development, :test do
  gem 'byebug', '11.0.1', platforms: %i[mri mingw x64_mingw]
  gem 'pry'
end

group :development do
  gem 'barista'
  gem 'bcrypt'
  gem 'web-console', '4.0.1'
end

group :test do
  gem 'capybara', '3.28.0'
  gem 'rails_helper'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'selenium-webdriver', '3.142.4'
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers', branch: 'rails-5'
  gem 'webdrivers', '4.1.2'
end

group :production do
  gem 'pg', '1.1.4'
  gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
  gem 'image_processing'
  gem 'jquery-rails'
  gem 'jquery-turbolinks'
  gem 'json'
  gem 'kaminari'
  gem 'listen', '3.1.5'
  gem 'mini_magick', '>= 4.3.5'
  gem 'pusher'
  gem 'rails_bootstrap_navbar'
  gem 'shrine', '~> 3.0'
  gem 'sidekiq'
  gem 'sidekiq-cron', '~> 1.1'
  gem 'sidekiq-scheduler'
  gem "image_processing"
  gem "mini_magick", ">= 4.3.5"
  gem 'geocoder'
  gem 'simple_form'
  gem 'spring',                '2.1.0'
  gem 'spring-watcher-listen', '2.0.1'
  gem 'therubyracer', require: nil
  gem 'warden'
  gem 'devise'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
