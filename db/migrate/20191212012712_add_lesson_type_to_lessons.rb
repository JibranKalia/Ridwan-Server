class AddLessonTypeToLessons < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :type, :string, null: false, default: :type_one
  end
end
