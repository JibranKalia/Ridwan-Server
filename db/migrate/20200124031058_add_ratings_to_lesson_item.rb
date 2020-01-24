class AddRatingsToLessonItem < ActiveRecord::Migration[6.0]
  def change
    add_column :lesson_items, :ratings, :integer
  end
end
