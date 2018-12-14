class ChangePeCompleteToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :pe_complete, :boolean
    add_column :users, :pe_complete, :string
  end
end
