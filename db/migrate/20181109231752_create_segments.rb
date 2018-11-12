class CreateSegments < ActiveRecord::Migration[5.2]
  def change
    create_table :segments do |t|
      t.integer :segment_id
      t.string :subject_id
      t.string :name

      t.timestamps
    end
  end
end
