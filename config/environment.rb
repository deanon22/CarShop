# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: 587,
  domain: 'carshop-rails.herokuapp.com',
  authentication: 'plain',
  enable_starttls_auto: true,
  user_name: Rails.application.credentials[:sendgrid][:SENDGRID_USERNAME],
  password: Rails.application.credentials[:sendgrid][:SENDGRID_PASSWORD]
  }
