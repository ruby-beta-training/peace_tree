# == Schema Information
#
# Table name: users_projects
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_users_projects_on_project_id  (project_id)
#  index_users_projects_on_user_id     (user_id)
#
require 'rails_helper'

RSpec.describe UsersProject, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
