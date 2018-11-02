class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :courses, :string
    add_column :users, :credits, :integer
    add_column :users, :degrees, :string
  end
end
