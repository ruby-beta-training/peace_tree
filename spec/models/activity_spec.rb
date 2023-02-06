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
require 'rails_helper'

RSpec.describe Activity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
