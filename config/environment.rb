# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
RailsApp::Application.initialize!

ENV['RAILS_ENV'] = 'development'
#ENV['RAILS_ENV'] = 'production' 

