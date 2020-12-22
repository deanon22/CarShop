# Preview all emails at http://localhost:3000/rails/mailers/service_mailer
class ServiceMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/service_mailer/new_service
  def new_service
    service = Service.last  
    ServiceMailer.new_service(service)
  end

end
