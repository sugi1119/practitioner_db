class PrescriptionSupplementsController < ApplicationController

  def new
    @prescription_supplement = PrescriptionSupplement.new(:prescription_id => params[:prescription_id].to_i)

    @supplements = Supplement.all
  end

  def create
    p = PrescriptionSupplement.new(prescription_supplement_params)

    if p.save
      redirect_to Prescription.find(p.prescription_id)
    else
      render :new
    end
  end

  def edit
    @prescription_supplement = PrescriptionSupplement.find params[:id]
  end

  def update
    p = PrescriptionSupplement.find params[:id]

    if p.save
      p.update prescription_supplement_params
      redirect_to Prescription.find(p.prescription_id)
    else
      render :edit
    end

  end

  def destroy
    prescription_supplement = PrescriptionSupplement.find params[:id]
    prescription_supplement.destroy

    redirect_to prescription_path(prescription_supplement.prescription)
  end


  private
    def prescription_supplement_params
    params.require(:prescription_supplement).permit(:qty, :prescription_id, :supplement_id)
    end
end
# prescription_supplements GET    /prescription_supplements(.:format)              prescription_supplements#index
#                              POST   /prescription_supplements(.:format)              prescription_supplements#create
#  new_prescription_supplement GET    /prescription_supplements/new(.:format)          prescription_supplements#new
# edit_prescription_supplement GET    /prescription_supplements/:id/edit(.:format)     prescription_supplements#edit
#      prescription_supplement GET    /prescription_supplements/:id(.:format)          prescription_supplements#show
#                              PATCH  /prescription_supplements/:id(.:format)          prescription_supplements#update
#                              PUT    /prescription_supplements/:id(.:format)          prescription_supplements#update
#                              DELETE /prescription_supplements/:id(.:format)          prescription_supplements#destroy