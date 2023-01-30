puts '~> Create projects'

User.all.each do |user|
  unless user.has_role? (:admin)
    5.times do
      user.projects.create!(
        project_name: Faker::Name.name,
        project_type: Faker::Address.full_address,
        description: Faker::Markdown.emphasis,
        address: Faker::Address.full_address,
        area: Faker::Address.full_address,
        status: Faker::Markdown.emphasis
      )
    end
  end
end
