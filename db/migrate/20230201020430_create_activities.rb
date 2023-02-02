class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.string :employee_ids, array: true, default: []
      t.date :startdate
      t.string :time

      t.belongs_to :project

      t.timestamps
    end
  end
end
