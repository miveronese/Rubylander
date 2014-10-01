class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :lesson_id
      t.text :text
      t.string :result
      t.timestamps
    end
  end
end
