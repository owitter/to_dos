class AddCourseCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :courses_count, :integer
  end
end
