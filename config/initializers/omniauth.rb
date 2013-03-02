#Create app in
#Add ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FACEBOOK_CONFIG['app_id'], FACEBOOK_CONFIG['secret'], scope: 'publish_stream'
end