class CreatePrescriptionSupplement < ActiveRecord::Migration
  def change
    create_table :prescription_supplements do |t|
      t.integer :qty
      t.integer :prescription_id
      t.integer :supplement_id

      t.timestamps
    end
  end
end
