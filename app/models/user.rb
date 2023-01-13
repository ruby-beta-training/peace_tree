# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_initialize :set_default_role
  has_one :employee
  accepts_nested_attributes_for :employee, allow_destroy: true, update_only: true
  scope :employees, -> { without_role(:admin) }
  scope :employees_department, ->(department_id) { includes(:employee).where('department_id = ?', department_id) }

  def auth_token
    JsonWebToken.encode(user_id: id, user_email: email)
  end


  private

  def set_default_role
    self.roles ||= :employee
  end

end
