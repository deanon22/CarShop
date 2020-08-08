class ServiceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.service_mailer.new_service.subject
  #
  def new_service
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
