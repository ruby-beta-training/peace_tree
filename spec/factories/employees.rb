# == Schema Information
#
# Table name: employees
#
#  id           :bigint           not null, primary key
#  address      :string
#  full_name    :string
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint
#
# Indexes
#
#  index_employees_on_user_id  (user_id)
#
FactoryBot.define do
  factory :employee do
    full_name { "MyString" }
    address { "MyString" }
    phone_number { "MyString" }
  end
end
