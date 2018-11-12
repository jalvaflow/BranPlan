class CreateCourseRequirements < ActiveRecord::Migration[5.2]
  def change
    create_table :course_requirements do |t|
      t.string :course_id
      t.string :requirement

      t.timestamps
    end
  end
end
