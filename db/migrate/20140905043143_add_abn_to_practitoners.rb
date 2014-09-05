class AddAbnToPractitoners < ActiveRecord::Migration
  def change
    add_column :practitioners, :abn_number, :integer
    add_column :practitioners, :address, :string
    add_column :practitioners, :postcode, :string
  end
end
