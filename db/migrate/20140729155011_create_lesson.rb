class CreateLesson < ActiveRecord::Migration
  def change
    create_table :lesson do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
