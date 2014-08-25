class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
     t.integer :tutorial_id
	 t.string :title
	 t.text :description

      t.timestamps
    end
  end
end
