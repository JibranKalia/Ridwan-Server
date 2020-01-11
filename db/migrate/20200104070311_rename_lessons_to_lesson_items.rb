# frozen_string_literal: true

class RenameLessonsToLessonItems < ActiveRecord::Migration[6.0]
  def change
    rename_table :lessons, :lesson_items
  end
end
