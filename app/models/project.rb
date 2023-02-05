# == Schema Information
#
# Table name: projects
#
#  id           :bigint           not null, primary key
#  address      :string
#  area         :string
#  description  :text
#  project_name :string
#  project_type :string
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Project < ApplicationRecord
  has_many :users_projects, dependent: :destroy
  has_many :users, through: :users_projects
  has_many :activities, dependent: :destroy

  scope :projects_name, ->(name) { where('project_name ILIKE ?', "%#{name}%") if name.present? }
end
