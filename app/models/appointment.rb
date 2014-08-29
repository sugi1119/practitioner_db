# == Schema Information
#
# Table name: appointments
#
#  id               :integer          not null, primary key
#  appointment_date :datetime
#  practitioner_id  :integer
#  patient_id       :integer
#  taken            :boolean
#  created_at       :datetime
#  updated_at       :datetime
#

class Appointment < ActiveRecord::Base
  belongs_to :practitioner
  belongs_to :patient

  # def initialize(attributes=nil)
  #   attr_with_defaults = {:taken => false}.merge(attributes)
  #   super(attr_with_defaults)
  # end
end
