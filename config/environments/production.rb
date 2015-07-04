Rails.application.configure do
  config.assets.initialize_on_precompile = false
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Enable Rack::Cache to put a simple HTTP cache in front of your application
  # Add `rack-cache` to your Gemfile before enabling this.
  # For large-scale production use, consider using a caching reverse proxy like nginx, varnish or squid.
  # config.action_dispatch.rack_cache = true

  # Disable Rails's static asset server (Apache or nginx will already do this).
  config.serve_static_assets = true

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # Generate digests for assets URLs.
  config.assets.digest = true

  # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb
  config.secret_key = 'abf1e49effbfa647465e47358a296118e439ae4f01e3ed0247e1faf5d946cc0bfc157219192737335b070b9c028eb9346e8f331c4532d0f3c7aaf610a48ca7fe'
  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # Set to :debug to see everything in the log.
  config.log_level = :info

  # Prepend all log lines with the following tags.
  # config.log_tags = [ :subdomain, :uuid ]
  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?
  # Use a different logger for distributed setups.
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { :host => 'renascence.herokuapp.com/'}
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => "plain",
  :user_name => 'app38502952@heroku.com',
  :password => 'kbqqyikp1540',
  :domain => 'renascence.herokuapp.com/',
  :enable_starttls_auto => true
}
end
