class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :course_id
      t.text :description
      t.date :due_date
      t.string :assignment_name

      t.timestamps

    end
  end
end
