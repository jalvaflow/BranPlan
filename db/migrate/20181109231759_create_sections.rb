class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :section_id
      t.string :comment
      t.string :course
      t.integer :section
      t.string :details
      t.string :status
      t.string :status_text
      t.integer :enrolled
      t.integer :limit
      t.integer :waiting

      t.timestamps
    end
  end
end
