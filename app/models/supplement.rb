# == Schema Information
#
# Table name: supplements
#
#  id             :integer          not null, primary key
#  item_name      :string(255)
#  package_amount :float
#  item_cost      :float
#  created_at     :datetime
#  updated_at     :datetime
#

class Supplement < ActiveRecord::Base
  has_many :prescriptions,  :through => :prescription_supplements

  has_many :prescription_supplements

  def supplement_line
    "#{self.try(:item_name)} - #{self.try(:package_amount)} - #{self.try(:item_cost)}"
  end
end
