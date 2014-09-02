class CreatePrescription < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.text :recommendation
      t.text :dosage
      t.integer :consultation_id

      t.timestamps

    end
  end
end
