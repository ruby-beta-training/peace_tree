# == Schema Information
#
# Table name: activities
#
#  id           :bigint           not null, primary key
#  description  :text
#  employee_ids :string           default([]), is an Array
#  name         :string
#  startdate    :date
#  time         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  project_id   :bigint
#
# Indexes
#
#  index_activities_on_project_id  (project_id)
#
class Activity < ApplicationRecord
  belongs_to :project
end
