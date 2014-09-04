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
  has_many :invoices, :trough => :invoice_menus
  has_many :invoice_menus

  def menu_package
    "#{serlf.try(:menu_item)} - $ #{self.try(:menu_cost)}"
  end

end
