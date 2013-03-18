#Create app in
#Add ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, CONFIG['facebook_app_id'], CONFIG['facebook_secret'], scope: 'publish_stream'
  provider :twitter, CONFIG['twitter_consumer_key'], CONFIG['twitter_consumer_secret']
end
