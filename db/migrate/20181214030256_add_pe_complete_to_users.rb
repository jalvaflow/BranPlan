class AddPeCompleteToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pe_complete, :string
  end
end
