class CreateSectionTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :section_times do |t|
      t.string :section_id
      t.integer :start
      t.integer :end
      t.string :days
      t.string :type
      t.string :building
      t.string :room

      t.timestamps
    end
  end
end
