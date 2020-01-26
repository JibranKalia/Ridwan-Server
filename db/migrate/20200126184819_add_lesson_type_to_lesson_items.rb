class AddLessonTypeToLessonItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :lesson_items, :lesson_type, foreign_key: true
  end
end
