class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new patient_params

    if @patient.save
      flash[:notice] = "register successfully."
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @patient = Patient.find params[:id]
  end

  def show
    @patient = Patient.find params[:id]
  end

  def update
    patient = Patient.find params[:id]
    patient.update patient_params
    flash[:notice] = "Patient details is now updated."

    redirect_to patient
  end

  def destroy
    @patient = Patient.find[:id]
    @patient.destroy

    redirect_to patients_path
  end


  private
  def patient_params
    params.require(:patient).permit(:title, :f_name, :m_name, :l_name, :address, :postcode, :phone, :mobile, :dob, :occupation)
  end
end

# t.string   "title"
# t.string   "f_name"
# t.string   "m_name"
# t.string   "l_name"
# t.string   "address"
# t.string   "postcode"
# t.string   "phone"
# t.string   "mobile"
# t.date     "dob"
# t.string   "occupation"

#     patients GET    /patients(.:format)               patients#index
#              POST   /patients(.:format)               patients#create
#  new_patient GET    /patients/new(.:format)           patients#new
# edit_patient GET    /patients/:id/edit(.:format)      patients#edit
#      patient GET    /patients/:id(.:format)           patients#show
#              PATCH  /patients/:id(.:format)           patients#update
#              PUT    /patients/:id(.:format)           patients#update
#              DELETE /patients/:id(.:format)           patients#destroy