class CreatePractitioner < ActiveRecord::Migration
  def change
    create_table :practitioners do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :password_digest
      t.boolean :is_admin, :default => false
    end
  end
end
