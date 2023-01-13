# == Schema Information
#
# Table name: employees
#
#  id            :bigint           not null, primary key
#  address       :string
#  full_name     :string
#  phone_number  :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :bigint
#  user_id       :bigint
#
# Indexes
#
#  index_employees_on_department_id  (department_id)
#  index_employees_on_user_id        (user_id)
#
class Employee < ApplicationRecord
  belongs_to :user
  belongs_to :department

  validates :phone_number, presence: true,
                           length: { minimum: 10, maximum: 15 }
end
