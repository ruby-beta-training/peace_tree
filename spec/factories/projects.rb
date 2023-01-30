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
FactoryBot.define do
  factory :project do
    project_name { 'MyString' }
    string { 'MyString' }
    project_type { 'MyString' }
    description { 'MyText' }
    address { 'MyString' }
    area { 'MyString' }
    status { 'MyString' }
  end
end
