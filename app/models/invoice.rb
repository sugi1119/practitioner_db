# == Schema Information
#
# Table name: invoices
#
#  id              :integer          not null, primary key
#  conusltation_id :integer
#  service_item    :string(255)
#  service_cost    :float
#  created_at      :datetime
#  updated_at      :datetime
#

class Invoice < ActiveRecord::Base
  belongs_to :consultation
end
