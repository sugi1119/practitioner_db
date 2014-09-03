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
  # has_many :invoices :through => :invoice_servicemenus

  has_many :invoice_servicemenus

  def service_list

  end


end
