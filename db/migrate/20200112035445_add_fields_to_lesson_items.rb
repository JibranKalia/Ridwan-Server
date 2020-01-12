class AddFieldsToLessonItems < ActiveRecord::Migration[6.0]
  def change
    add_column :lesson_items, :quality_one, :integer, default: 0, null: false
    add_column :lesson_items, :quality_two, :integer, default: 0, null: false
  end
end
