puts '~> Create users'

100.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: '123456789'
  )
  user.add_role(:employee)
  Employee.create!(
    full_name: Faker::Name.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    user_id: user.id,
    department_id: Random.rand(1..3)
  )
end
