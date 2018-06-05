class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :user_id
      t.integer :assignment_id
      t.string :course_name

      t.timestamps

    end
  end
end
