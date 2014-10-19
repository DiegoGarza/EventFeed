# Load the Rails application.
require File.expand_path('../application', __FILE__)

ActionMailer::Base.smtp_settings = {
  :address => "smtp.sendgrid.net",
  :port => 25,
  :domain => "localhost",
  :authentication => :plain,
  :user_name => "canalesb",
  :password => "heyah123"
}

# Initialize the Rails application.
Rails.application.initialize!
