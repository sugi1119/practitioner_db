class SessionController < ApplicationController
  def new
  end

  def create
    practitioner = Practitioner.find_by(:email => params[:email])
    if practitioner.present? && practitioner.authenticate(params[:password])
      session[:practitioner_id] = practitioner.id
      redirect_to root_path
    else
      flash[:notice] = "Invalid login. Please try again."
      redirect_to login_path
    end
  end

  def destroy
    session[:practitioner_id] = nil
    redirect_to login_path
  end
end
