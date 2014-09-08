class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all
  end

  def create
     # raise 'err create'
    invoice = Invoice.create invoice_params
    invoice.consultation_id = params[:consultation_id]
    invoice.status = false

    if invoice.save
      invoice.status = true
      redirect_to invoice
    else
      render :new
    end
  end

  def new
    @invoice = Invoice.new
    @consultation = Consultation.find params[:consultation_id]

  end

  def edit
    @invoice = Invoice.find params[:id]
  end

  def show
    # raise 'err'
    @invoice = Invoice.find params[:id]
    @consultation = @invoice.consultation_id

    supplement_pick

    @sub_total = []
    @total_cost = 0
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

    def supplement_pick
      prescription = Prescription.all.select{|ps| ps.consultation_id = @consultation}

      @pre_supplement = PrescriptionSupplement.all.select{|s| s.prescription_id}

      #<PrescriptionSupplement id: 1, qty: 1, prescription_id: 1, supplement_id: 3, created_at: "2014-09-08 11:21:20", updated_at: "2014-09-08 11:21:32">,
      #<PrescriptionSupplement id: 2, qty: 1, prescription_id: 1, supplement_id: 2, created_at: "2014-09-08 11:21:43", updated_at: "2014-09-08 11:21:43">]



      # raise 'er'

      # @supplement_provide = []
      # pre_supplement.each do |sup|
      #   << sup[:supplement_id]
      # end

      # @supplement_costs = []

      # @supplement_provide.each do |i|
      #   x = Supplement.find i
      #   @supplement_item = x.item_name
      #   @supplement_cost = x.item_cost
      #   @supplement_costs << x.item_cost
      # end

      # @supplement_total_cost = @supplement_costs.reduce(:+)

    end

end