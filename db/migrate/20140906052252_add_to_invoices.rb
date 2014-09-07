class AddToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :charged_line, :integer, array: true
  end
end
