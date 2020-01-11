# frozen_string_literal: true

class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :name, null: false
      t.date :date, null: false
      t.references :enrollment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
