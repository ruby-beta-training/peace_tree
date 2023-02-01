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
require 'rails_helper'

RSpec.describe Employee, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
