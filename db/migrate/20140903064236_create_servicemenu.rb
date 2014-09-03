class CreateServicemenu < ActiveRecord::Migration
  def change
    create_table :servicemenus do |t|
      t.string :service_item
      t.float :service_cost

      t.timestamps
    end
  end
end
