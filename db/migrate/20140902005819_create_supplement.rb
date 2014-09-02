class CreateSupplement < ActiveRecord::Migration
  def change
    create_table :supplements do |t|
      t.string :item_name
      t.float :package_amount
      t.float :item_cost

      t.timestamps
    end
  end
end
