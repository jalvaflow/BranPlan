class CreateDegrees < ActiveRecord::Migration[5.2]
  def change
    create_table :degrees do |t|
      t.string :name
      t.string :degree_type
      t.integer :electives
      t.integer :cores
      t.string :description
      t.string :site_link
      t.string :core_courses
      t.string :elective_courses

      t.timestamps
    end
  end
end
