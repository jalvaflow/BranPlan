class CreateSectionInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :section_instructors do |t|
      t.string :section_id
      t.string :instructor_id

      t.timestamps
    end
  end
end
