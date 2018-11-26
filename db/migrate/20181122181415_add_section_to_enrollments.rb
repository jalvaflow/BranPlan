class AddSectionToEnrollments < ActiveRecord::Migration[5.2]
  def change
    add_column :enrollments, :section_id, :integer
  end
end
