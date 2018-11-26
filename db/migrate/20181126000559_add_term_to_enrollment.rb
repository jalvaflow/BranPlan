class AddTermToEnrollment < ActiveRecord::Migration[5.2]
  def change
    add_column :enrollments, :term_id, :integer
  end
end
