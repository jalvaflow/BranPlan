class CreateTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :terms do |t|
      t.string :term_id
      t.string :comment
      t.string :name
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
