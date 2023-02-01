class CreateUsersProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :users_projects do |t|
      t.belongs_to :user
      t.belongs_to :project

      t.timestamps
    end
  end
end
