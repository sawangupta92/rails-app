class Admin::SessionsController < ApplicationController
  # skip_before_action :authenticate_admin_user!, only: [:new, :create]

  def new
    redirect_to admin_root_path if current_user&.admin?
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.admin? && user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_root_path, notice: "Logged in successfully."
    else
      flash.now[:alert] = "Invalid email or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to admin_login_path, notice: "Logged out successfully."
  end
end
