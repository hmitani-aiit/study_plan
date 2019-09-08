Devise.setup do |config|
  require 'devise/orm/active_record'
  config.omniauth :google_oauth2,
                  ENV['GOOGLE_APP_ID'], 
                  ENV['GOOGLE_APP_SECRET'],
                  :skip_jwt => true,
                  name: :google
end