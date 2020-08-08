class ServicesController < ApplicationController

  def index
    if params[:car_id]
      @services = Service.where(:car_id => params[:car_id]).order(service_date: :desc)
    else
      @services = Service.order(service_date: :desc) 
    end            
  end

  def new
    @service = Service.new
    @service.car_id = params[:car_id]
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      flash[:success] = "Service was successfully created"
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
end
private
  def service_params
    params.require(:service).permit(:service_date, :description, :notes, :mileage, :nickname, :car_id, uploads:[])
  end
  def set_service
    @service = Service.find(params[:id])
  end



  
