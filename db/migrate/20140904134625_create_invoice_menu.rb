class CreateInvoiceMenu < ActiveRecord::Migration
  def change
    create_table :invoice_menus do |t|
      t.integer :menu_id
      t.integer :invoice_id
      t.integer :quantity

      t.timestamps
    end
  end
end
