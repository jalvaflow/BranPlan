class CreateUserCourseHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :user_course_histories do |t|
      t.integer :user_id
      t.string :course_code

      t.timestamps
    end
  end
end
