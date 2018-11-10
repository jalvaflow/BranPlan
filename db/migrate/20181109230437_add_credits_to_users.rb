class AddCreditsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :credits, :string
  end
end
