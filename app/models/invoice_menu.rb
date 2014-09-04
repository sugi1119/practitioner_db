# == Schema Information
#
# Table name: invoice_menus
#
#  id         :integer          not null, primary key
#  menu_id    :integer
#  invoice_id :integer
#  quantity   :integer
#  created_at :datetime
#  updated_at :datetime
#

class InvoiceMenu < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :menu
end
