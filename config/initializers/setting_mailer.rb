
config.action_mailer.raise_delivery_errors = true
config.action_mailer.default_url_options = { :host => 'localhose:3000'}
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_setting = {
  :address => 'smtp.sendgrid.new',
  :port => '587',
  :authentication => :plain,
  :user_name => 'app34862435@heroku.com',
  :password => 'kbrhc1jk',
  :domain => 'psara-institute.com/',
  :enable_starttls_auto => true
}