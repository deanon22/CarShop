class ServiceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.service_mailer.new_service.subject
  #
  def new_service
    @service = params[:service]
    @greeting = "Hi owner of #{@service.car.nickname}"
    #{@service.car.nickname}
    # @user = params[:user]
    
    @description = @service.description
    

    mail to: 'jdean22@gmail.com',from: 'jdean22@gmail.com', subject: "A new service added for #{@service.car.nickname}"
  end
end
