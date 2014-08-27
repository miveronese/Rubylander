class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      
      t.string :language
      t.string :programming_language

      t.timestamps
    end
  end
end
