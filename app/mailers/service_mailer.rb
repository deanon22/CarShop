class ServiceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.service_mailer.new_service.subject
  #
  def new_service
    @greeting = "Hi Jason"
    # @user = params[:user]
     @service = params[:service]
    @description = @service.description
    

    mail to: 'jdean22@gmail.com', subject: "Services for #{@service.car.nickname}"
  end
end
