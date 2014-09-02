class PrescriptionsController < ApplicationController

  def index
    @prescriptions = Prescription.all
  end

  def create
    prescription = Prescription.create prescription_params
    prescription.consultation_id = params[:consultation_id]

    if prescription.save
      redirect_to prescription_path(prescription)
    else
      render :new
    end

  end

  def new
    @consultation = Consultation.find params[:consultation_id]
    @prescription = Prescription.new
  end

  def edit
    @prescription = Prescription.find params[:id]
  end

  def show
    @prescription = Prescription.find params[:id]

  end

  def update
    @consultation = Consultation.find params[:consultation_id]
    prescription = Prescription.find params[:id]
    prescription.update prescription_params

    redirect_to prescription
  end

  def destroy
    prescription = Prescription.find params[:id]
    prescription.destroy

    redirect_to prescription_path
  end

  def choose
    @supplements = Supplement.all
  end

  def add_supplements
    prescription = Prescription.find params[:id]
    prescription.save

    params[:supplement].each do |supplement_id, quantity|
      supplement = Supplement.find supplement_id
      if quantity.present?
        # dosage = Dosage.create(:quantity => quantity, :supplement_id => supplement_id)
        # prescription.dosage << dosage
      end
    end

      redirect_to prescription_path
  end

  private
    def prescription_params
      params.require(:prescription).permit(:recommendation, :dosage, :consultation_id)
    end

end

# t.text     "recommendation"
# t.text     "dosage"
# t.integer  "consultation_id"

#     prescriptions GET    /prescriptions(.:format)                      prescriptions#index
#                   POST   /prescriptions(.:format)                      prescriptions#create
# edit_prescription GET    /prescriptions/:id/edit(.:format)             prescriptions#edit
#      prescription GET    /prescriptions/:id(.:format)                  prescriptions#show
#                   PATCH  /prescriptions/:id(.:format)                  prescriptions#update
#                   PUT    /prescriptions/:id(.:format)                  prescriptions#update
#                   DELETE /prescriptions/:id(.:format)                  prescriptions#destroy
#  new_prescription GET    /prescriptions/:consultation_id/new(.:format) prescriptions#new