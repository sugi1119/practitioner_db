Practitioner.destroy_all
Patient.destroy_all
# Appointment.destroy_all

pr1 = Practitioner.create(:name => 'Admin admin', :phone => '123456789', :email => 'admin@example.com', :password => 'password', :password_confirmation => 'password', :is_admin => 'true' )
pr2 = Practitioner.create(:name => 'Yuko Sugiyama', :phone => '987654321', :email => 'sugi@example.com', :password => 'password', :password_confirmation => 'password')

pa1 = Patient.create(:f_name => 'Zoe', :m_name => 'doggy', :l_name => 'Thedoggy', :title => 'Ms', :address => '1 Lamrocky Road Bondi Beach NSW', :postcode => '2026', :phone => '012345678', :mobile => '0412345678', :dob => '1980-05-06',:occupation => 'security gurd')
