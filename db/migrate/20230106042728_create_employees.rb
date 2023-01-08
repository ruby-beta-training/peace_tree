class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :full_name
      t.string :address
      t.string :phone_number
      t.belongs_to :user

      t.timestamps
    end
  end
end
