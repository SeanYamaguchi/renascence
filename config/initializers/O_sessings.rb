class Settings < Settingslogic
	source "#{Rails.root}/config/omniauth_settings.yml"
	namespace Rails.env
end