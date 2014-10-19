# Load the Rails application.
require File.expand_path('../application', __FILE__)

ActionMailer::Base.smtp_settings = {
  :address => "smtp.sendgrid.net",
  :port => 25,
  :domain => "heyah.me",
  :authentication => :plain,
  :user_name => "DiegoGarza",
  :password => "Heyah.123"
}

# Initialize the Rails application.
Rails.application.initialize!
