# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Carbongroove::Application.initialize!


Rails::Initializer.run do |config|  
  require 'yaml'
  
  # support yaml and heroku config vars, preferring ENV for heroku
  CONFIG = (YAML.load_file('config/config.yml')[RAILS_ENV] rescue {}).merge(ENV)

end