class PractitionersController < ApplicationController

  before_action :check_if_logged_in, :except => [:new, :create]
  before_action :check_if_admin, :only => [:index]

  def index
    @practitioners = Practitioner.all
  end

  def new
    @practitioner = Practitioner.new
  end

  def create
    @practitioner = Practitioner.new practitioner_params

    if @practitioner.save
      flash[:notice] = "Sign up successfully."
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @practitioner = Practitioner.find params[:id]
  end

  def show
    @practitioner = Practitioner.find params[:id]
  end

  def update
    practitioner = Practitioner.find params[:id]
    practitioner.update practitioner_params
    flash[:notice] = "Practitioner details is now updated."

    redirect_to practitioner
  end

  def destroy
    @practitioner = Practitioner.find[:id]
    @practitioner.destroy

    redirect_to practitioners_path
  end

  private
    def practitioner_params
        params.require(:practitioner).permit(:name, :phone, :email, :password, :password_confirmation, :abn_number, :address, :postcode)
    end

    def check_if_logged_in
        redirect_to(new_practitioner_path) if @current_user.nil?
    end

    def check_if_admin
        redirect_to(root_path) unless @current_user.is_admin?
    end

end

#           Prefix Verb   URI Pattern                      Controller#Action
#     practitioners GET    /practitioners(.:format)          practitioners#index
#                  POST   /practitioners(.:format)          practitioners#create
#  new_practitioner GET    /practitioners/new(.:format)      practitioners#new
# edit_practitioner GET    /practitioners/:id/edit(.:format) practitioners#edit
#      practitioner GET    /practitioners/:id(.:format)      practitioners#show
#                  PATCH  /practitioners/:id(.:format)      practitioners#update
#                  PUT    /practitioners/:id(.:format)      practitioners#update
#                  DELETE /practitioners/:id(.:format)      practitioners#destroy

# t.string  "name"
# t.string  "phone"
# t.string  "email"
# t.string  "password_digest"
# t.boolean "is_admin",        default: false