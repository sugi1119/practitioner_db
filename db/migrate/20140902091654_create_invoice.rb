class CreateInvoice < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :conusltation_id
      t.string :charge_item
      t.float :charge_cost


      t.timestamps
    end
  end
end
