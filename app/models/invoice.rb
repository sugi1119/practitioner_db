# == Schema Information
#
# Table name: invoices
#
#  id              :integer          not null, primary key
#  consultation_id :integer
#  item            :string(255)
#  cost            :float
#  status          :boolean
#  created_at      :datetime
#  updated_at      :datetime
#  charged_line    :integer          is an Array
#

class Invoice < ActiveRecord::Base
  belongs_to :consultation
  # has_and_belongs_to_many :menus

end
