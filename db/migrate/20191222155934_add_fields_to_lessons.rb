class AddFieldsToLessons < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :from_surah, :integer
    add_column :lessons, :from_ayah, :integer
    add_column :lessons, :to_surah, :integer
    add_column :lessons, :to_ayah, :integer
  end
end
