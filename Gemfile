source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'
# Use sqlite3 as the database for Active Record
# Use pg as the database for heroku
group :development do
  gem 'sqlite3'
end

group :development, :test do
  gem 'hirb'         # モデルの出力結果を表形式で表示するGem
  gem 'hirb-unicode' # 日本語などマルチバイト文字の出力時の出力結果のずれに対応

  gem 'pry-rails'  # rails console(もしくは、rails c)でirbの代わりにpryを使われる
  gem 'pry-doc'    # methodを表示
  gem 'pry-byebug' # デバッグを実施
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
# Use LESS for stylesheets
gem "less-rails"
gem "therubyracer"
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'validates_email_format_of'
# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'slim-rails'

gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git', :branch => "bootstrap3"
# For devise
gem 'devise'
gem 'omniauth-twitter'
# Cloudinary
gem 'cloudinary'
  # For uploderruby
gem 'carrierwave'
gem 'streamio-ffmpeg'
gem 'ransack', '1.3.0'

gem 'redis'
gem 'redis-rails'
gem 'resque', :require => 'resque/server'
gem 'resque_mail_queue'
gem 'daemon-spawn', :require => 'daemon_spawn'
gem 'systemu'
gem 'aws-ses', '~> 0.5.0', :require => 'aws/ses'
gem 'resque_mailer'

gem 'acts-as-taggable-on', '~> 3.4'
gem 'jquery-ui-rails'
gem 'gon'
# SEO
gem 'meta-tags'
gem 'sitemap_generator'