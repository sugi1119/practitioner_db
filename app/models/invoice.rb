# == Schema Information
#
# Table name: invoices
#
#  id              :integer          not null, primary key
#  consultation_id :integer
#  charge_item     :string(255)
#  charge_cost     :float
#  created_at      :datetime
#  updated_at      :datetime
#

class Invoice < ActiveRecord::Base
  belongs_to :consultation
  has_and_belongs_to_many :menus
  # has_one :patient, :through => :consultation
  # has_one :practitioner, :trough => :consultation
end
