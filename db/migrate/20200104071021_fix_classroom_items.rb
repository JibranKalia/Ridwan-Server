class FixClassroomItems < ActiveRecord::Migration[6.0]
  def change
    remove_reference :lesson_items, :enrollment, index: true, foreign_key: true
    add_reference :lesson_items, :lesson, index: true, foreign_key: true
    remove_column :lesson_items, :date, :date
    remove_column :lesson_items, :type, :string
  end
end
