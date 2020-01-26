class CreateLessonTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :lesson_types do |t|
      t.string :name, null: false
      t.integer :position, null: false, default: 1
      t.references :classroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
