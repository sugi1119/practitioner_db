class InvoicesController < ApplicationController

    def index
    @invoices = Invoice.all
  end

  def create
    raise 'err'
    invoice = Invoice.new invoice_params
    invoice.save

    redirect_to invoice
  end

  def new
  # raise 'err'
    @invoice = Invoice.new
    @consultation = Consultation.find params[:consultation_id]
    # @prescriptions = @appointment.prescriptions

    # @prescription = Prescription.find params[:prescription_id]
    # @prescription.appointment_id = [:appointment_id]
    #@appointment = Appointment.find params [:appointment_id]

 # raise params.inspect
  end

  def edit
    @invoice = Invoice.find params[:id]
  end

  def show
    raise 'err'
    @invoice = Invoice.find params[:id]
    @consultation = Consultation.find[:id]
  end

  def update
    invoice = Invoice.find params[:id]
    invoice.upate invoice_params

    redirect_to invoice
  end

  def destroy
    invoice = Invoice.find params[:id]
    invoice.destroy

    redirect_to invoices_path
  end

  private
    def invoice_params
      params.require(:invoice).permit(:consultation_id, :item, :cost, :status, :charged_line )
    end

end