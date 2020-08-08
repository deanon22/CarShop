class CarsController < ApplicationController
  
  def index
    @cars = Car.all 
  end

  def edit
    @car = Car.find(params[:id])
  end

  def show
    @car = Car.find(params[:id])
    @car_services = @car.services

  end
  
  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      flash[:success] = "Car successfully updated"
      redirect_to car_path(@car)
    else 
      render 'edit'
    end
  end


  private
    def car_params
      params.require(:car).permit(:nickname, :model, :year, :make)
    end

    def set_car
      @car = Car.find(params[:id])
    end

  end

