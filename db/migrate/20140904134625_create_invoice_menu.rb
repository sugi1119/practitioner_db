class CreateInvoiceMenu < ActiveRecord::Migration
  def change
    create_table :invoices_menus, :id => false do |t|
      t.integer :menu_id
      t.integer :invoice_id

    end
  end
end
