# frozen_string_literal: true

class AddTeacherToClassrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :classrooms, :teacher, null: false, foreign_key: true
    remove_reference :classrooms, :user, null: false, foreign_key: true
  end
end
