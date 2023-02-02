puts '~> Create admin'

2.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: '123456789'
  )
  user.add_role(:admin)
end
