puts '~> Create users'

admin = User.create(email: 'admin@gmail.com', password: '12345678')
admin.add_role(:admin)

user = User.create(email: 'user@gmail.com', password: '12345678')
user.add_role(:user)
