# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  config.mailer_sender = 'noreply@yourdomain'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [ :email ]

  config.strip_whitespace_keys = [ :email ]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true

  config.password_length = 8..128

  config.reset_password_within = 6.hours

  config.scoped_views = true

  config.sign_out_via = :delete

  config.omniauth :twitter, "P2ALMQ7SKZlLpgYOBwamJxqcR", "NEzp2CiToQkFZR7wk00jRt9h5KS2a7KxwofIYu1mI5J1y1YYlq"
  config.secret_key = '1d9559b775ecee257300aa57e035767f3d1ad79605a365edb73952c9ddf3f65e781ccd56eec4bde592cdf47472e744e05f095987356812d5aa9fa5b9d97d64b6'
end
