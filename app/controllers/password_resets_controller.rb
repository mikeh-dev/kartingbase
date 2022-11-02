class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user 
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:success] = "Password reset email sent"
      redirect_to root_url
    else
      flash[:danger] = "No accounts exists with that E-mail"
      render 'new', status: :unprocessable_entity
    end
  end
  


  def edit

  end

  private
    def get_user
      @user = User.find_by(email: params[:email])
    end

    def valid_user
      unless (@user && @user.activated? &&
              @user.authenticated?(:reset, params[:id]))
      redirect_to root_url
      end
    end

end
