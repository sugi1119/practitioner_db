class CreateAppointment < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :appointment_date
      t.integer :practitioner_id
      t.integer :patient_id
      t.boolean :taken

      t.timestamps
    end
  end
end
