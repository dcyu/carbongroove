#Create app in
#Add ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '425626420845320', 'f2b5b6497678f93fe9d2edbf9cae0e23', scope: 'publish_stream'
end