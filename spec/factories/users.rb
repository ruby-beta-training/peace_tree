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
FactoryBot.define do
  factory :user do
    sequence(:email) { Faker::Internet.safe_email }
    password { '123456789' }
  end

  trait :user do
    after(:create) { |user| user.add_role(:employee) }
  end

  # factory :employee do
  #   full_name { Faker::Name.name }
  #   address { Faker::Address.full_address }
  #   phone_number { Faker::PhoneNumber.phone_number }
  #   user_id { create(:user).id }
  #   department_id { Random.rand(1..3) }
  # end

  trait :admin do
    after(:create) { |user| user.add_role(:admin) }
  end
end
