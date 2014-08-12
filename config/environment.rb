# Load the Rails application.
require File.expand_path('../application', __FILE__)

ActionMailer::Base.smtp_settings = {
 :user_name => ENV["LAWVU_MAILER_USERNAME"],
 :password => ENV["LAWVU_MAILER_PWD"],
 :domain => ENV["LAWVU_MAILER_DOMAIN"],
 :address => ENV["LAWVU_MAILER_ADDRESS"],
 :port => 587,
 :authentication => :plain,
 :enable_starttls_auto => true,
 :sender_address => ENV['LAWVU_MAILER_SENDER']
}

# Initialize the Rails application.
Rails.application.initialize!
