class DropNameFromLessonItemLessonTypeMandatory < ActiveRecord::Migration[6.0]
  def change
    change_column_null :lesson_items, :lesson_type_id, true
    remove_column :lesson_items, :name, :string
  end
end
