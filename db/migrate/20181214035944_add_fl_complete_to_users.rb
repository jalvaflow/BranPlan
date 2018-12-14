class AddFlCompleteToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fl_complete, :string
  end
end
