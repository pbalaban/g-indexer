source 'https://rubygems.org'
source 'https://rails-assets.org'

ruby '2.1.5'

gem 'rails', '4.2.0'
gem 'pg'

gem 'uglifier', '>= 1.3.0'
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'haml-rails'

gem 'rails-assets-jquery'
gem 'rails-assets-jquery-ujs'
gem 'rails-assets-bootstrap'

gem 'rails_config'
gem 'exception_notification'
gem 'mailgun_rails'
gem 'resque'
gem 'resque-scheduler'

group :production, :staging do
  gem 'unicorn'
end

group :development do
  gem 'unicorn-rails'

  gem 'capistrano', '~> 3.3.0'
  gem 'capistrano-rvm'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano3-unicorn'

  gem 'guard-rails', require: false
  gem 'guard-bundler', require: false
  gem 'guard-resque', require: false, github: 'railsjedi/guard-resque'
  gem 'guard-resque-scheduler', require: false, github: 'tbprojects/guard-resque-scheduler'

  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'pry-rails'
  gem 'pry-nav'
  gem 'pry-doc'

  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'quiet_assets'
end
