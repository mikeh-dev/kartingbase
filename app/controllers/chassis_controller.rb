class ChassisController < ApplicationController
  before_action :find_chassis, only: [:show, :edit, :update, :destroy]


  def index
    @chassis = Chassis.all
  end

  def show
    @chassis = Chassis.find(params[:id])
  end

  def new
    @chassis = Chassis.new
  end

  def create
    @chassis = Chassis.new(chassis_params)
    if @chassis.save
      flash[:notice] = "Chassis created!"
      redirect_to @chassis
    else
      render 'new', status: :unprocessable_entity
      flash[:notice] = "Chassis not created!"
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
    flash[:success] = "Chassis deleted"
    redirect_back_or_to(root_url, status: :see_other)
  end

  private

  def chassis_params
    params.require(:chassis).permit(:make, :model, :year, :stolen)
  end

  def find_chassis
    @chassis = Chassis.find(params[:id])
  end

end
