# == Schema Information
#
# Table name: consultations
#
#  id                        :integer          not null, primary key
#  initial_consultation_note :text
#  appointment_id            :integer
#  created_at                :datetime
#  updated_at                :datetime
#

class Consultation < ActiveRecord::Base
  belongs_to :appointment
  has_one :patient, :through => :appointment
  has_one :practioner, :through => :appoinment
  has_many :prescriptions
end
