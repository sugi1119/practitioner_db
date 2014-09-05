Practitioner.destroy_all
Patient.destroy_all
# Appointment.destroy_all

pr1 = Practitioner.create(:name => 'Admin admin', :phone => '123456789', :email => 'admin@example.com', :password => 'password', :password_confirmation => 'password', :is_admin => 'true', :abn_number => '98789', :address => '2 Pacific highway Chatswood NSW', :postcode => '2067' )
pr2 = Practitioner.create(:name => 'Yuko Sugiyama', :phone => '987654321', :email => 'sugi@example.com', :password => 'password', :password_confirmation => 'password', :abn_number => '345435', :address => '3 Pacific highway Chatswood NSW', :postcode => '2067')

pa1 = Patient.create(:f_name => 'Zoe', :m_name => 'doggy', :l_name => 'Thedoggy', :title => 'Ms', :address => '1 Lamrocky Road Bondi Beach NSW', :postcode => '2026', :phone => '012345678', :mobile => '0412345678', :dob => '1980-05-06',:occupation => 'security gurd')
