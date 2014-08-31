class ConsultationsController < ApplicationController

  def index
    @consultations = Consultation.all
  end

  def new
    consultation = Counsultation.new
  end

  def create
    @consultation = Consultation.new consultation_params

  end

  def edit
    @consultation = Consultation.find params[:id]
  end

  def update
    @consultaion = Consultation.find params[:id]

    @consultation.update consultation_params
    flash[:notice] = "Consultation note is updated"

    redirect_to @consultaion
  end

  def show
    @consultation = Consultation.find params[:id]
  end

  def destroy
    consultation = Consultation.find params[:id]
    consultation.destroy

    redirect_to consultations_path
  end


  private
    def consulation_params
      params.require(:consultation).permit(:initial_consultation_noe, :appointment_id)

    end
end

# t.text     "initial_consultation_note"
# t.integer  "appointment_id"

#     consultations GET    /consultations(.:format)          consultations#index
#                   POST   /consultations(.:format)          consultations#create
#  new_consultation GET    /consultations/new(.:format)      consultations#new
# edit_consultation GET    /consultations/:id/edit(.:format) consultations#edit
#      consultation GET    /consultations/:id(.:format)      consultations#show
#                   PATCH  /consultations/:id(.:format)      consultations#update
#                   PUT    /consultations/:id(.:format)      consultations#update
#                   DELETE /consultations/:id(.:format)      consultations#destroy
