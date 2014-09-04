class InvoiceMenusController < ApplicationController

  def new
    @invoice_menu = InvoiceMenu.new(:invoice_id => params[:invoice_id].to_i)

    @menus = Menu.all
  end

  def create
    im = InvoiceMenu.new(invoice_menu_params)

    if im.save
      redirect_to Invoice.find(im.invoice_id)
    else
      render :new
    end
  end

  def edit
    @invoice_menu = InvoiceMenu.find params[:id]
  end

  def update
    im = InvoiceMenu.find params[:id]

    if im.save
      im.update invoice_menu_params
      redirect_to Invoice.find(im.invoice_id)
    else
      render :edit
    end

  end

  def destroy
    invoice_menu = InvoiceMenu.find params[:id]
    invoice_menu.destroy

    redirct_to invoice_path(invoice_menu.invoice)
  end

  private
    def invoice_menu_params
      params.require(:invoice_menu).permit(:invoice_id, :menu_id, :quantity)
    end
end

