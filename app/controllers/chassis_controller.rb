class ChassisController < ApplicationController
  before_action :find_chassis, only: [:show, :edit, :update, :destroy]


  def index
    @chassis = Chassis.all
  end

  def show
  end

  def new
    @chassis = Chassis.new
  end

  def create
    @chassis = Chassis.new(params[:chassis])
    if @chassis.save
      redirect_to @chassis, :notice => "Successfully created chassis."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @chassis.update_attributes(params[:chassis])
      redirect_to @chassis, :notice  => "Successfully updated chassis."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @chassis.destroy
    redirect_to chassis_url, :notice => "Successfully destroyed chassis."
  end

  private

  def chassis_params
    params.require(:chassis).permit(:make, :model, :year, :stolen)
  end

  def find_chassis
    @chassis = Chassis.find(params[:id])
  end

end
