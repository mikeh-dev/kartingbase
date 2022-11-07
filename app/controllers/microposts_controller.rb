class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost Created!"
      redirect_to root_url #not sure about this redirect, surely should go to microposts index?
    else
     render 'static_pages/home', status: :unprocessable_entity    
    end
  end

  def destroy

  end


  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end

  
end
