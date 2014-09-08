class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
     # t.integer :id_courses
	 t.string :title
	 t.text :description

      t.timestamps
    end
  end
end
