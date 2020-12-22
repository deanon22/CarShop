class ServicesController < ApplicationController

  def index
    if params[:car_id]
      @services = Service.where(:car_id => params[:car_id]).order(created_at: :desc).page params[:page] 
    else
      @services = Service.order(created_at: :desc).page params[:page] 
    end            
  end

  def new
    @service = Service.new
    @service.car_id = params[:car_id]
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      ServiceMailer.with(service: @service).new_service.deliver_now#deliver_later(wait: 1.minutes)
      flash[:notice] = "Service was successfully created"
      redirect_to service_path(@service)
    else 
      render 'new'
      flash[:error] = "Something went wrong!!!"
    end
  end

  def show
    @service = Service.find(params[:id])
  end

  def edit
    @service = Service.find(params[:id])
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    flash[:danger] = "Service has been removed"
    redirect_to services_path
    
  end
  
  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      flash[:success] = "Service successfully updated"
      redirect_to service_path(@service)
    else 
      render 'edit'
    end
  end

  def convert_tz
    current_time = Time.now.in_time_zone('America/New_York')  
  end

  def delete_image_attachment
    @upload = ActiveStorage::Blob.find_signed(params[:id])
    @upload.attachments.first.purge_later
    redirect_back(fallback_location: services_path)
  end

end

private
  def service_params
    params.require(:service).permit(:service_date, :description, :notes, :mileage, :cost, :nickname, :car_id, uploads:[])
  end
  def set_service
    @service = Service.find(params[:id])
  end



  
