class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :string
      t.string :project_type
      t.text :description
      t.string :address
      t.string :area
      t.string :status

      t.timestamps
    end
  end
end
