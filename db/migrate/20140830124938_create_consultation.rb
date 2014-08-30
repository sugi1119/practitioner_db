class CreateConsultation < ActiveRecord::Migration
  def change
    create_table :consultations do |t|
      t.text :initial_consultation_note
      t.integer :appointment_id

      t.timestamps
    end
  end
end
