# == Schema Information
#
# Table name: prescription_supplements
#
#  id              :integer          not null, primary key
#  qty             :integer
#  prescription_id :integer
#  supplement_id   :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class PrescriptionSupplement < ActiveRecord::Base
  belongs_to :prescription
  belongs_to :supplement


end
