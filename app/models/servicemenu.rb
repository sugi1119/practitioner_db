# == Schema Information
#
# Table name: servicemenus
#
#  id           :integer          not null, primary key
#  service_item :string(255)
#  service_cost :float
#  created_at   :datetime
#  updated_at   :datetime
#

class Servicemenu < ActiveRecord::Base

  has_and_belongs_to_many :invoices

  def service_list
     "Service item: #{self.try(:service_item)} / cost:$ #{self.try(:service_cost)}"
  end

end

