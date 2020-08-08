class PartsController < ApplicationController
  def index
    @parts = Part.all
  end

  def show
    @part = Part.find(params[:id])
  end

  def new
    @part = Part.new
    @part.service_id = params[:service_id]
  end
  
  def create
    @part = Part.new(part_params)    
    if @part.save
      flash[:success] = "Part was successfully created"
      redirect_to service_path(@part.service_id)
    else 
      render 'new'
      flash[:error] = "Something went wrong!!"
    end
  end

  def update
    @part = Part.find(params[:id])
    if @part.update(part_params)
      flash[:success] = "Part successfully updated"
      redirect_to service_path(@part.service_id)
    else 
      render 'edit'
    end
  end

  def edit
    @part = Part.find(params[:id])  
    
  end

  def destroy
    @part = Part.find(params[:id])
    @service = @part.service_id
    @part.destroy
    flash[:danger] = "#{@part.name} has been removed"
    redirect_to service_path(@service)
  end

  private
  
  def part_params
    params.require(:part).permit(:name, :description, :price, :service_id)
  end

end

