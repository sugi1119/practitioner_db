class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all
  end

  def create
    # raise allen way
    invoice = Invoice.new invoice_params
    invoice.menus = []

    # raise 'err'
    invoice.menus << Menu.find(params[:menu_id])

    # invoice = Invoice.create invoice_params
    # invoice.menus << Menu.find(params[:menu_id])
    # invoice.consultation_id = params[:consultation_id]

# raise 'err'
    if invoice.save
      redirect_to invoice_path(invoice)
    else
      render :new
    end

  end

  def new
   if Invoice.find params[:id]
      @consultation = Consultation.find params[:consultation_id]
      @menus = Menu.all
      @invoice = Invoice.find params[:id]

    else
      @consultation = Consultation.find params[:consultation_id]
      @menus = Menu.all
      @invoice = Invoice.new()
    end

  end

  def edit
    @invoice = Invoice.find params[:id]
  end

  def show

    @invoice = Invoice.find params[:id]
    consultation_id = @invoice.consultation_id
    # raise 'err'
    @consultation = Consultation.find consultation_id
    # raise 'err'

  end

  def update
    invoice = Invoice.find params[:id]
     # raise 'err'
    consultation_id = invoice.consultation_id
    consultation = Consultation.find consultation_id

    # raise 'err'

    # @consultation = Consultation.find params[:consultation_id]
    # invoice = Invoice.find params[:id]
    # raise 'errrr'

    if invoice.save
      # raise 'err'
      redirect_to invoice
    else
      render :edit
    end

  end

  def destroy
    invoice = Invoice.find params[:id]
    invoice.destroy

    redirect_to invoice_index
  end

  # def choose
  #   @menus = Menu.all
  # end

  # def add_menu
  #    invoice = Invoice.find params[:id]

  #    invoice.menu << additional_menu
  #   # invoice.save

    # params[:menu].each do |menu_id|
    #   additional_menu = Menu.find menu_id
    #   invoice.menu << additional_menu
    # end
      # if cost.present?
  #   #   end
  #   redirect_to invoice_path
    # end

    # redirect_to invoice_path
  # end


  private
    def invoice_params
      params.require(:invoice).permit(:consultation_id, :charge_item, :charge_cost )
    end
end

# invoice_index GET    /invoice(.:format)                               invoice#index
#                  POST   /invoice(.:format)                               invoice#create
#      new_invoice GET    /invoice/new(.:format)                           invoice#new
#     edit_invoice GET    /invoice/:id/edit(.:format)                      invoice#edit
#          invoice GET    /invoice/:id(.:format)                           invoice#show
#                  PATCH  /invoice/:id(.:format)                           invoice#update
#                  PUT    /invoice/:id(.:format)                           invoice#update
#                  DELETE /invoice/:id(.:format)                           invoice#destroy