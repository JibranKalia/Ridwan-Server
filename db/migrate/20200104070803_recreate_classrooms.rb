class RecreateClassrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.date :date, null: false
      t.references :enrollment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
