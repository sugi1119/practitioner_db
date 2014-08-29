# == Schema Information
#
# Table name: practitioners
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  phone           :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  is_admin        :boolean          default(FALSE)
#

class Practitioner < ActiveRecord::Base
  has_secure_password
  validates :email, :presence => true

  has_many :appointments
  has_many :patients, through: :appointments
end
