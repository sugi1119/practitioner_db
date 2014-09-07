class CreateInvoice < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :consultation_id
      t.string :item
      t.float :cost
      t.boolean :status

      t.timestamps
    end
  end
end
