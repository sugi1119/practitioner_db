class CreateInvoiceServicemenu < ActiveRecord::Migration
  def change
    create_table :invoice_servicemenus, :id => false do |t|
        t.integer :servicemenu_id
        t.integer :invoice_id

    end
  end
end

