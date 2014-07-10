class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :string
      t.text :text

      t.timestamps
    end
  end
end
