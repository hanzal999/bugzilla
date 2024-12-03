#Explicit global source to avoid bundler warnings
source "https://rubygems.org"

ruby '3.2.0'

# Use Rails 6.1.7.10, compatible with Ruby 3.2.0
gem 'rails', '~> 8.0.0'

# PostgreSQL as the database
gem 'pg', '~> 1.1'

# Authentication and environment management
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-github'
gem 'omniauth-rails_csrf_protection'
gem 'dotenv-rails'
gem 'thin'

# Use Puma as the app server
gem 'puma', '~> 5.6'

# SCSS for stylesheets
gem 'sassc-rails', '>= 2.1'

# Use Webpacker as needed
gem 'webpacker', '~> 5.0'

# Turbo for navigation (keep if using Rails 6's Turbo)
gem 'turbolinks', '~> 5'

# JSON API builder
gem 'jbuilder', '~> 2.11'

# Secure password
gem 'bcrypt', '~> 3.1.7'

# Performance optimization
gem 'bootsnap', '>= 1.11.1', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.2'
  gem 'rack_session_access'
  gem 'database_cleaner-active_record'
end

group :development do
  gem 'web-console', '>= 4.2.0'
  gem 'rack-mini-profiler', '~> 3.0'
  gem 'listen', '~> 3.7'
  gem 'spring'
  gem 'better_errors', '~> 2.9'
  gem 'binding_of_caller', '~> 1.0'
end

group :test do
  gem 'capybara', '>= 3.36'
  gem 'selenium-webdriver', '~> 4.0'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'simple_form', '~> 5.1'
gem 'active_model_serializers', '~> 0.10.13'