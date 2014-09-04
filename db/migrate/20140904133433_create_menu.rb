class CreateMenu < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :menu_item
      t.float :menu_cost

      t.timestamps
    end
  end
end
