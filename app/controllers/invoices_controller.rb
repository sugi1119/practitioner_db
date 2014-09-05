class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all
  end

  def create
    # raise
    invoice = Invoice.new invoice_params
    invoice.menus << Menu.find(params[:menu_id])
    # invoice.charge_item = @servicemenu.service_item
    # invoice.charge_cost = @servicemenu.service_cost

    if invoice.save
      redirect_to invoice_path(invoice)
    else
      render :new
    end

  end

  def new
    # raise 'err'
    @consultation = Consultation.find params[:consultation_id]
    @menus = Menu.all
    @invoice = Invoice.new()
    # menu_id = invoice_menus.menu_id

    # @invoice.charge_item = @servicemenu.service_item
    # @invoice.charge_cost = @servicemenu.service_cost




    # servicemenu =

  end

  def edit
    @invoice = Invoice.find params[:id]
  end

  def show

    # raise 'err'
    @invoice = Invoice.find params[:id]
  end

  def update
    @consultation = Consultation.find params[:consultation_id]
    invoice = Invoice.find params[:id]

    if invoice.update invoice_params
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

  def choose
    @menus = Menu.all
  end

  def add_service
    invoice = Invoice.find params[:id]
    invoice.save

    # params[:servicemenu].each do |servicemenu_id, cost|
    #   servicemnu = Servicemenu.find servicemenu_id
    #   if cost.present?
    #   end
    redirect_to invoice_path
  end


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