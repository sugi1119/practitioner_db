# == Schema Information
#
# Table name: invoices
#
#  id              :integer          not null, primary key
#  conusltation_id :integer
#  charge_item     :string(255)
#  charge_cost     :float
#  created_at      :datetime
#  updated_at      :datetime
#

class Invoice < ActiveRecord::Base
  belongs_to :consultation
  has_many :menus, :through => :invoice_menus
  has_many :invoice_menus
  # has_one :patient, :through => :consultation
  # has_one :practitioner, :trough => :consultation
end
