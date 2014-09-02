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
  belongs_to :consultation
  has_many :supplements, :through => :prescription_supplements
  has_many :prescription_supplements
end
