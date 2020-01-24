class AddRatingsToLessonItem < ActiveRecord::Migration[6.0]
  def change
    add_column :lesson_items, :rating, :integer
  end
end
