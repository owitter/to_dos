class AddAssignmentCountToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :assignments_count, :integer
  end
end
