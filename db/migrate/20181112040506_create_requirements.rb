class CreateRequirements < ActiveRecord::Migration[5.2]
  def change
    create_table :requirements do |t|
      t.string :requirement_id
      t.string :comment
      t.string :long
      t.string :short

      t.timestamps
    end
  end
end
