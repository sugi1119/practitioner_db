# == Schema Information
#
# Table name: prescriptions
#
#  id              :integer          not null, primary key
#  recommendation  :text
#  dosage          :text
#  consultation_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Prescription < ActiveRecord::Base
end
