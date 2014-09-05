# == Schema Information
#
# Table name: menus
#
#  id         :integer          not null, primary key
#  menu_item  :string(255)
#  menu_cost  :float
#  created_at :datetime
#  updated_at :datetime
#

class Menu < ActiveRecord::Base
  has_and_belongs_to_many  :invoices

  def menu_package
    "#{self.try(:menu_item)} - AUD: #{self.try(:menu_cost)}"
  end

end


