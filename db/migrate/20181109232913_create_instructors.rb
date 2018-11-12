class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :instructor_id
      t.string :comment
      t.string :email
      t.string :first
      t.string :middle
      t.string :last

      t.timestamps
    end
  end
end
