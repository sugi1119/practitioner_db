class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all
  end

  def create
  end

  def new

  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  # def service_list

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