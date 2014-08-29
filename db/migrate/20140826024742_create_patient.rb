class CreatePatient < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :title
      t.string :f_name
      t.string :m_name
      t.string :l_name
      t.string :address
      t.string :postcode
      t.string :phone
      t.string :mobile
      t.date :dob
      t.string :occupation

      t.timestamps
    end
  end
end
