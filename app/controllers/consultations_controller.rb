class ConsultationsController < ApplicationController

  def index
    @consultations = Consultation.all
  end

  def create
    consultation = Consultation.create consultation_params
    consultation.appointment_id = params[:appointment_id]

    if consultation.save
      if params[:prescription] == 'Yes'
        redirect_to new_prescription_path consultation.id

      elsif params[:prescription] == 'No'
        redirect_to new_invoice_path consultation.id
      else
        render :new
      end
    else
      render :new
    end

  end


  def new
    @appointment = Appointment.find params[:appointment_id]
    @consultation = Consultation.new

  end



  def edit
    @consultation = Consultation.find params[:id]
  end

  def update
    @appointment = Appointment.find params[:appointment_id]
    @consultaion = Consultation.find params[:id]

    @consultation.update consultation_params
    flash[:notice] = "Consultation note is updated"

    redirect_to @consultaion
  end

  def show
    @consultation = Consultation.find params[:id]

    if params[:prescription] == 'Yes'
      redirect_to new_prescription_path consultation.id
    elsif params[:prescription] == 'No'
      redirect_to consultations_path
    else
      render :show
    end

  end

  def destroy
    consultation = Consultation.find params[:id]
    consultation.destroy

    redirect_to consultations_path
  end


  private
    def consultation_params
      params.require(:consultation).permit(:initial_consultation_note, :appointment_id)

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
