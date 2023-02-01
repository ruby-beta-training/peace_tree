class Deletecolumfromproject < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :string
  end
end
