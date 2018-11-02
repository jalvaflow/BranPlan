class RemoveFieldsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :degrees
    remove_column :users, :credits
    remove_column :users, :courses
  end
end
