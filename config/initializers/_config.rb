require 'yaml'  

CONFIG = if File.exist?('config/config.yml')
  YAML.load_file("#{Rails.root}config/config.yml")[Rails.env]
else
  ENV # for Heroku
end
